# 2383-Inspired Look System

Use this reference to translate the user's aesthetic request into image-editing language. This is a visual finishing system, not a LUT specification.

## Important distinction

KODAK VISION Color Print Film 2383 is a projection-contrast print film intended for printing from a negative or intermediate. Kodak's technical sheet emphasizes sharpness, fine grain, tone-scale consistency, and halation protection. The user's requested result combines a **2383-inspired print color/contrast character** with a **separate, Resolve-like creative halation treatment**. Keep the two layers distinct and restrained.

## Stacked film-board composition

The default layout is a portrait 3:4 film board containing two subject-led landscape 4:3 crops of the same source photograph: an ungraded dominant crop above and a slightly tighter 2383-inspired crop below.

- Reproduce the confirmed Porsche baseline as an exact 1086×1449 px template. Use the deterministic compositor; do not interpret the panel geometry as a range.
- Place the untouched upper crop at exactly 810×624 px at x=139, y=101. Place the 2383-inspired lower crop at exactly 628×456 px at x=229, y=822. Choose each cover crop independently and allow the lower crop to be 5–12% tighter while preserving the primary identity cue. Never distort the source to fit.
- Center the exact “Kodak-2383” label on a fixed baseline at 94.5% of canvas height. Treat it and the lower print as one locked group, but do not let source content change the lower rectangle or label position.
- Lock the same canvas dimensions, panel rectangles, gap, bottom breathing room, and label baseline across a series. If geometry falls outside tolerance, regenerate with geometry as the only correction.
- Use only crops from the actual source. Do not distort, extend, redraw, or substitute a regenerated scene. Preserve faces first; keep gesture-defining hands; keep full vehicle/product silhouettes where feasible; keep essential signs and characters whole.
- Sample the board color from the upper ungraded crop rather than applying a fixed palette. Add visible but quiet physical pigment behavior: broad brush/roller smears, overlapping translucent passes, directional drag, rubbed-through thin areas, soft pigment buildup and fine film-base grain. The board must not read as a flat color fill. Avoid uniform noise, repeating texture, heavy crackle, pure white, cream stationery or a hue disconnected from the source.
- Prefer asymmetrical broken edge activity. Combine an uneven amber-red emulsion lip, short incomplete red/cyan registration offsets, dry-brushed chemical residue, a tide line and one localized exposure accent. Keep effects within roughly 5–8% of the lower perimeter. Never draw one continuous clean outline around the lower image.
- Keep at least 95% of the lower image clear. Never dissolve faces, vehicles, products, essential architecture, or the main landscape silhouette. Use dissolution only as a small optional accent when explicitly requested.
- Use restrained analog atmosphere around the lower image: fine grain, translucent light leak, faint exposure band, soft reflected color, chemical tide line, or subtle emulsion-registration texture. Avoid torn paper, ink splatter, uniform feathering, broad bleaching, or a digital mask appearance.
- Connect the two sections through shared margins, a repeated highlight color, aligned edges, or a soft light path. The result should feel like one designed object rather than two unrelated images.
- Add only the exact small label “Kodak-2383” centered directly below the lower print in the confirmed template. Do not add other film-stock codes, fake technical data, captions, arrows, dates, brand marks, logos, or watermarks unless requested.

## Large-format practical-cinema direction

When the user references cerebral large-format thrillers or monumental practical filmmaking, translate that request into transferable traits rather than literal imitation:

- emphasize physical scale, deep perspective, real-location texture, and architectural or landscape weight;
- preserve natural daylight or motivated practical light instead of adding fantasy illumination;
- use controlled cool blue-gray or steel shadow separation against selective warm highlights;
- keep saturation restrained, blacks deep but readable, whites clean, and highlight roll-off smooth;
- favor austere tension, clarity, and material realism over dreamy haze, neon spectacle, or comic-book contrast;
- preserve documentary credibility beneath the 2383-inspired print finish.

## Tonal target

- Build a confident print-like contrast curve with dense, clean lower tones.
- Keep the darkest useful textures visible; avoid featureless black clipping.
- Give midtones enough density to suppress phone-HDR flatness without making faces dull.
- Compress the brightest values progressively into a soft shoulder while preserving local highlight shape.
- Retain a clear white point; do not turn the whole image beige, gray, or faded.
- Preserve microcontrast in the subject while taking the brittle digital edge off specular highlights.

## Color target

Treat these as adaptive tendencies rather than a universal palette:

- Keep skin natural, dimensional, and protected from green, orange, or magenta contamination.
- Let warm highlights feel creamy, amber, or gently golden only when supported by the source light.
- Let neutral or cool shadows lean subtly cool, cyan, blue-gray, or green-gray only when supported by the scene.
- Favor subtractive-looking color density: saturated colors feel deeper and more material, not neon-bright.
- Restrain high-saturation reds, oranges, greens, and blues before they clip or become synthetic.
- Separate warm and cool regions through local light logic rather than applying a global teal-orange split.
- Preserve meaningful product paint, clothing, signage, vegetation, sky, and practical-light colors.

## Scene adaptation

### Daylight and overcast

Use neutral whites, modestly cool shadows, smooth sky roll-off, and gentle warmth in sunlit skin or pale surfaces. Avoid yellowing clouds and foliage. Do not switch halation off merely because the scene is daylight: map a visible warm fringe to the hardest sunlit boundaries, sky gaps, glass, chrome, water reflections, pale architecture, and bright surfaces against shadow. Add a restrained broader highlight-diffusion layer around the brightest clusters so the optical film response remains perceptible without veiling the frame.

### Golden hour and backlight

Protect luminous highlights, retain amber light, deepen cooler shaded regions, and allow halation along sunlit hair, windows, chrome, and hard rim light. Avoid orange flooding.

### Tungsten interiors

Retain warm practicals while keeping skin from becoming uniformly orange. Let unlit shadows remain neutral-to-cool if the source supports it. Halation belongs around bulbs and high-contrast fixtures, not walls or faces.

### Neon and mixed night light

Preserve different practical-light colors, control extreme saturation, maintain deep but readable blacks, and use localized warm-red halation only at the brightest boundaries. Do not replace colored neon with one hue.

### Vehicles, products, and architecture

Protect body lines, panel gaps, wheel geometry, material finishes, glass, logos, and structural edges. Keep the object itself crisp; restrict softness and glow to reflected or emitted highlights.

## Halation model

Halation is not generic bloom. Describe it as:

- limited to edges where a genuinely bright highlight meets a darker neighboring region;
- a thin warm red-orange or amber-red inner fringe with a softer, low-opacity outer falloff;
- irregular and exposure-dependent rather than an even outline;
- stronger around small intense practical lights, backlit edges, chrome, wet reflections, windows, and specular points;
- weaker or absent on matte midtones, skin contours without hard backlight, shadow edges, and low-contrast surfaces;
- subordinate to the highlight itself, with local detail still visible;
- spatially narrow enough that the base image remains crisp.

Use two related layers when the scene supports them:

1. **Halation fringe:** the narrower warm red-orange edge response, strongest immediately outside an eligible highlight.
2. **Highlight diffusion:** a broader, softer, lower-saturation glow centered on only the brightest highlight clusters; keep local detail and overall contrast intact.

For **subtle**, make the effect visible on close inspection. For **balanced**, make the fringe clearly identifiable at normal viewing size and the diffusion gently perceptible around selected highlights. For **strong**, increase radius and intensity only around eligible highlights; never expand eligibility to the whole frame.

For daylight balanced grades, do not write `halation should be nearly absent`, `extremely subtle`, or equivalent weakening language. Prefer `visible at normal viewing size but localized`, and name the exact daylight edges that receive the effect.

Avoid red outlines around every object, uniform orange haze, lens flare streaks, veiling glare, dreamy diffusion over faces, and white bloom that erases source detail.

## Grain and sharpness

- Use fine, organic, nonuniform 35 mm-like grain at low opacity.
- Let grain vary naturally with tonal regions; avoid identical digital noise everywhere.
- Preserve eyes, hair, text, body lines, surface seams, and architecture.
- Use only a slight reduction of brittle digital sharpening. Do not blur the source.
- Do not add dust, scratches, frame jitter, gate weave, sprocket holes, or projection damage by default.

## Prompt vocabulary

Prefer:

`cinematic release-print density`, `2383-inspired print-film color`, `smooth highlight shoulder`, `clean dense blacks with retained texture`, `subtractive color richness`, `scene-adapted warm/cool separation`, `protected natural skin`, `localized warm red-orange halation on eligible highlight edges only`, `fine organic grain`, `crisp photographic detail beneath the film finish`.

Avoid vague prompts such as `make it cinematic`, `add a Kodak filter`, or `add film glow` without specifying spatial eligibility and invariants.

## Technical basis

- [Kodak: KODAK VISION Color Print Film 2383 / 3383 technical data](https://www.kodak.com/content/products-brochures/Film/KODAK-VISION-Color-Print-Film-2383-3383-data-sheet.pdf)
- [Blackmagic Design: DaVinci Resolve 19 New Features Guide — Film Look Creator](https://documents.blackmagicdesign.com/SupportNotes/DaVinci_Resolve_19_New_Features_Guide.pdf)
- [Blackmagic Design: DaVinci Resolve 19.1 New Features Guide — Halation controls](https://documents.blackmagicdesign.com/SupportNotes/DaVinci_Resolve_19_1_New_Features_Guide.pdf)
