#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 4 || $# -gt 6 ]]; then
  echo "Usage: $0 UPPER_SOURCE LOWER_GRADED BOARD_HEX OUTPUT [UPPER_GRAVITY] [LOWER_GRAVITY]" >&2
  exit 2
fi

upper_source="$1"
lower_graded="$2"
board_color="$3"
output="$4"
upper_gravity="${5:-Center}"
lower_gravity="${6:-Center}"

for input in "$upper_source" "$lower_graded"; do
  [[ -f "$input" ]] || { echo "Missing input: $input" >&2; exit 2; }
done

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT
script_dir="$(cd "$(dirname "$0")" && pwd)"
texture_asset="$script_dir/../assets/board-smear-texture.png"
edge_asset="$script_dir/../assets/lower-emulsion-edge.png"
[[ -f "$texture_asset" ]] || { echo "Missing texture asset: $texture_asset" >&2; exit 2; }
[[ -f "$edge_asset" ]] || { echo "Missing edge asset: $edge_asset" >&2; exit 2; }

upper="$tmp_dir/upper.png"
lower_inner="$tmp_dir/lower-inner.png"
lower_print="$tmp_dir/lower-print.png"
board="$tmp_dir/board.png"

convert "$upper_source" -auto-orient \
  -gravity "$upper_gravity" -resize '810x624^' -extent '810x624' "$upper"

convert "$lower_graded" -auto-orient \
  -gravity "$lower_gravity" -resize '620x448^' -extent '620x448' "$lower_inner"

# Build an incomplete, physically imperfect emulsion edge. The image itself
# remains clear; edge activity is restricted to short broken segments.
convert -size 628x456 xc:none \
  "$lower_inner" -geometry +4+4 -composite \
  "$edge_asset" -geometry +0+0 -composite \
  -fill none -stroke 'rgba(53,169,178,0.42)' -strokewidth 2 \
  -draw 'line 20,5 92,5 line 623,214 623,270' \
  -stroke 'rgba(247,154,73,0.38)' -strokewidth 5 \
  -draw 'line 392,452 520,451' \
  "$lower_print"

# Build a source-colored physical pigment board. Directional low-frequency
# noise and broad translucent strokes create rolled/brushed variation without
# becoming a repeating texture or competing with the photographs.
convert -size 1086x1449 "xc:${board_color}" \
  \( "$texture_asset" -resize '1086x1449!' -colorspace Gray +level '34%,66%' \) \
  -compose softlight -composite \
  \( -size 1086x1449 xc:none -fill none \
     -stroke 'rgba(255,255,255,0.085)' -strokewidth 54 \
     -draw 'line -40,245 1120,205' \
     -draw 'line -80,1110 1160,1060' \
     -stroke 'rgba(0,0,0,0.065)' -strokewidth 38 \
     -draw 'line -30,520 1120,565' \
     -draw 'line 40,1380 1090,1340' \
     -blur '0x13' \) -compose over -composite \
  -attenuate 0.006 -seed 2383 +noise Gaussian "$board"

convert "$board" \
  "$upper" -geometry +139+101 -composite \
  "$lower_print" -geometry +229+822 -composite \
  -font DejaVu-Serif -pointsize 18 -kerning 3 \
  -fill 'rgba(231,211,178,0.92)' -gravity North \
  -annotate '+0+1351' 'Kodak-2383' \
  "$output"

identify -format '%f %wx%h\n' "$output"
