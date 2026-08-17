---
name: kodak-2383-film-look
description: "Turn a user-supplied photograph into a vertical film-board artwork using a strict 1086×1449 locked template: an ungraded upper crop at 810×624 px and a smaller 2383-inspired lower crop at 628×456 px, with identical coordinates across a series. Use an adaptive source-derived board with visible low-contrast brushed/rolled pigment texture, plus irregular emulsion overflow, short red/cyan registration shifts, chemical tide marks, exposure traces, and localized light leaks around the lower print. Use for Kodak 2383, original-versus-film layouts, film-board posters, film print color, movie-still color, 胶片感, 电影感, 胶片调色, 柯达2383, 达芬奇光晕, halation, or consistent photo series. Also support classic full-frame grading when explicitly requested. Do not use for exact LUT creation, deterministic pixel-level grading, video processing, or unrelated film stocks."
---

# Kodak 2383 Film Look

Transform a supplied photo into a designed comparison artwork without changing its factual content. By default, build one 1086×1449 portrait composition using the locked reference geometry below. Place an ungraded subject-led crop above and a slightly tighter 2383-inspired crop below on an adaptive source-derived board. Choose both crops from the actual source; do not regenerate or extend the scene. The board must show visible low-contrast brushed or rolled pigment variation rather than a flat digital fill. Use irregular emulsion overflow, registration shifts and exposure traces to make the lower print feel physically processed.

Use image generation for every requested photo transformation. Treat a supplied image plus an edit request as sufficient consent; do not reconfirm. Inspect a local image with `view_image` before editing. Use the built-in image-generation tool by default and pass only the minimum required reference image.

Describe the result as **2383-inspired** or **2383 print-film character**, never as a colorimetrically exact Kodak LUT or an official Kodak/Blackmagic emulation. Read [references/look-system.md](references/look-system.md) before writing the edit prompt.

## Core workflow

1. Inspect the source and build a compact Source Map.
2. Infer scene type and preserve intentional lighting.
3. Select the requested strength; use **balanced** when unspecified.
4. Write one structured edit prompt containing the invariants, 2383-inspired tone/color target, localized halation behavior, grain, and exclusions.
5. Use the built-in image-generation tool to create only the lower 2383-inspired photographic crop. Do not ask it to typeset the complete board when strict series geometry is required.
6. Assemble the upper source crop, generated lower crop, board texture, edge treatment and label with `scripts/compose_locked_board.sh`. This deterministic stage owns all panel sizes and coordinates.
7. Inspect the result when possible. Regenerate the lower crop once with one precise correction if fidelity or the film effect fails; do not change the locked board geometry.
8. Return the finished image with a brief Chinese explanation of the treatment. Reveal the full prompt only when requested.

Do not ask for camera profile, color space, or grading controls when the user only wants a visual transformation. Ask one concise question only if no edit target is available or if two supplied images could both be the target.

## Output modes

Use **stacked film-board** by default:

- Output a portrait canvas of exactly **1086×1449 px**.
- Use the confirmed Porsche reference as a **strict fixed template**, never a range. Use deterministic compositing rather than relying on image-generation layout.
- Place the **upper source photograph** at exactly **810×624 px**, with top-left coordinate **x=139, y=101**. Choose a subject-led cover crop from the source. Preserve original color and tonality; do not redraw, extend, recolor or filter it.
- Place the **lower edited photograph** at exactly **628×456 px**, with top-left coordinate **x=229, y=822**. Use a modestly tighter subject-led cover crop, typically 5–12% tighter, while preserving identity, product silhouette, architectural focal point or essential sign.
- Lock the exact small “Kodak-2383” label to the same centered baseline used by `scripts/compose_locked_board.sh`. Do not move, enlarge, shrink or reflow the group according to the source.
- Keep this geometry identical across a series: upper rectangle, lower rectangle, horizontal centers, top coordinates, gap, label baseline, and bottom breathing room. Only the crop contents, adaptive board color, and restrained analog accents may change from image to image.
- Choose crops with this priority: preserve faces and identity before clothing; keep hands when they define the pose; retain complete vehicle or product silhouettes when feasible; preserve the key architectural opening, sign, or focal geometry; keep readable text whole rather than cutting through characters; never crop through a face, hand, wheel, logo, or essential letter when another valid crop exists.
- Render only the lower photograph with the selected 2383-inspired preset, localized two-layer halation, subtle optical softness, and fine organic grain.
- Derive the **film-board color adaptively from the upper ungraded crop**. Sample a meaningful source color, then reduce saturation and adjust value for separation. Build the board as a physical pigment field: broad translucent brush or roller smears, overlapping low-opacity passes, rubbed thin areas, subtle directional drag marks, pigment accumulation and fine grain. Keep the texture clearly visible at normal size but subordinate to the photographs. Never use a perfectly flat fill, uniform digital noise, repeating wallpaper texture, heavy crackle or unrelated plaster.
- Do not place the lower photograph inside a rigid rectangular frame. Match the confirmed reference edge language: a narrow uneven amber-red translucent emulsion overflow; one or two incomplete red/cyan registration shifts; dry-brushed chemical residue; a faint tide line; and one localized exposure band or light leak. Edge activity must vary in width and opacity, appear on short broken segments rather than outlining all four sides evenly, and occupy no more than roughly 5–8% of the lower perimeter. Avoid neat rounded cards, uniform strokes, clean digital borders or a simple colored rectangle.
- Use dissolution only when explicitly requested. When used, confine it to one or two small edge accents; never dissolve broad areas, the whole perimeter, or important subject matter.
- Unify the full poster with source-derived color fields, fine film-base grain, faint optical exposure bands, soft reflected color, and one controlled light path linking the upper original to the lower interpretation. Prefer asymmetry and material subtlety over decorative abundance.
- Give the lower cinematic image a large-format practical-cinema character: monumental spatial scale, naturalistic location light, crisp physical geometry, deep but readable blacks, restrained saturation, cool steel or blue-gray shadow separation, controlled warm practical highlights, and an austere sense of tension. Do not use a generic teal-orange blockbuster filter or imitate a named filmmaker literally.
- Keep hierarchy clear: the upper original is factual evidence; the lower print is the cinematic interpretation. The surrounding effects support the two images rather than competing with them.
- In the confirmed stacked template, place the exact small label **“Kodak-2383”** centered directly below the lower print. Keep it quiet, widely tracked, and subordinate; use no other title, caption, fake technical data, date, logo, watermark, or decorative text unless explicitly requested.
- Avoid a generic template feel. Adapt board color, crop position, narrow emulsion edge, registration accent, and exposure trace to the source while keeping both selected crops clearly readable.

Use **classic full-frame** only when the user explicitly asks for the original mode, no split, full-frame grading, or preservation of the source aspect ratio. In that mode, apply the 2383-inspired treatment to the whole photo and preserve the original crop and aspect ratio unless the user specifies otherwise.

## Source Map

Record internally:

- **Content invariants:** subject identity, pose, expression, product or vehicle geometry, architecture, text, logos, object count, background structure, crop, aspect ratio, and camera perspective.
- **Exposure class:** daylight, overcast, golden hour, tungsten interior, neon night, mixed light, backlit, or low-key.
- **Recognition colors:** skin, paint, clothing, brand colors, sky, vegetation, practical lights, or other hues that must stay credible.
- **Highlight map:** practical lamps, windows, chrome, reflections, rim light, sky breaks, and other genuinely bright edges eligible for halation.
- **Failure risks:** clipped highlights, crushed faces, existing heavy saturation, flat gray light, strong phone HDR, low resolution, or compression artifacts.

## Edit contract

Lock these requirements in every prompt:

- Preserve the original scene, perspective, depth of field, subject identity, and relative placement inside the selected crops. In stacked film-board mode, change only the crop, outer canvas, and presentation; in classic full-frame mode, keep the original composition and aspect ratio.
- Keep faces, hands, body proportions, product surfaces, vehicle body lines, wheels, lights, architecture, logos, signage, and readable text unchanged.
- Change only exposure balance, tonal response, color rendering, highlight halation, very subtle optical softness, and fine organic grain.
- Preserve plausible local light color. Do not neutralize intentional sunset, tungsten, neon, or mixed lighting into one global tint.
- Preserve highlight detail and shadow readability. The result may be denser, but not crushed, muddy, faded, or HDR-sharp.
- Add no objects, weather, fog, smoke, subtitles, logos, or watermarks inside either photograph. In stacked film-board mode, narrow emulsion edges, restrained light leaks, registration traces, surface grain, and abstract analog artifacts may appear only around the lower photograph and surrounding design area when they do not obscure the subject.

## Strength presets

Use the presets as relative art direction, not numeric claims:

- **Subtle:** gentle print-film contrast, nearly neutral color, barely visible edge halation, ultra-fine grain.
- **Balanced (default):** clear print-film density and color separation, smooth highlight roll-off, visibly warm edge halation at normal viewing size, restrained highlight diffusion, and fine grain. Keep both effects localized rather than faint.
- **Strong:** deeper color separation and denser print contrast, more legible but still localized halation, slightly more grain; preserve skin and highlight detail.

If the source is already contrasty or heavily processed, reduce the effective strength one level. If the source is flat, build contrast through midtone density and highlight roll-off rather than crushing the endpoints.

## Prompt structure

Write the image-edit prompt in five compact sections:

1. **Use case and target:** `style-transfer photo edit`; identify the supplied image as the sole edit target and state the selected strength.
2. **Invariants and layout:** repeat all source-specific content, identity, geometry, text, and perspective constraints; state portrait 3:4 stacked film-board geometry or classic full-frame crop behavior.
3. **Print-film grade:** specify scene-adapted 2383-inspired tone, color separation, highlight roll-off, black density, skin protection, and recognition colors.
4. **Spatial effects:** define eligible highlight edges, clearly visible warm halation, a restrained broader highlight-diffusion layer, minimal optical softness, and fine nonuniform grain. State that the base image remains sharp. For daylight, explicitly map halation to sunlit rims, bright sky gaps, reflections, pale walls, chrome, water, glass, and hard shadow boundaries instead of weakening it by default.
5. **Avoid:** forbid global red glow, bloom over the whole frame, haze, lifted milky blacks, crushed shadows, clipped highlights, oversaturation, teal-orange cliché grading, altered objects, extra text, borders, and watermarks.

Describe a finished photographic still. Do not describe node graphs, sliders, LUT files, or instructions to place a filter over the image.

## Multiple photos

For a requested series, analyze each photo separately but lock one strength and one family of tonal density, color separation, halation restraint, and grain scale. Issue one edit call per photo. Preserve each photo's own white balance and recognition colors; consistency means a shared finishing language, not one identical color cast.

In stacked film-board mode, lock the canvas ratio and the exact template coordinates: upper width 78%, upper top 7.5%, lower width 57%, lower top 60%, centered horizontal alignment, and label baseline 94.5%. Also lock the adaptive upper-image sampling method, narrow emulsion-registration vocabulary, and hierarchy across the series. Allow each source to produce a different board hue; consistency comes from the fixed geometry, sampling logic, value restraint, edge accents, and exposure treatment rather than one repeated color.

## Quality gate

Accept the result only when:

- the scene, perspective, objects, text, and subject identity remain unchanged; the crop and aspect ratio follow the selected output mode;
- stacked film-board output is portrait 3:4 and shows a subject-led ungraded landscape 4:3 crop above and a clearly 2383-inspired, modestly tighter landscape 4:3 crop below;
- both crops come only from the supplied photograph, retain the intended subject and factual content, and are neither distorted, extended, nor redrawn;
- the upper 4:3 original is exactly 78% of canvas width, horizontally centered with its top edge at 7.5% canvas height, with only the source-derived board visible around it and no white mat, card, shadow, or floating-frame appearance;
- the lower 4:3 print is exactly 57% of canvas width, horizontally centered with its top edge at 60% canvas height, and the label baseline is fixed at 94.5% canvas height; all outputs in a series use these identical coordinates and 3:4 canvas dimensions;
- the lower landscape crop remains clear and readable, with a narrow analog emulsion-registration edge rather than a rigid frame or broad dissolution;
- the background is a subtly textured color field sampled adaptively from the upper ungraded crop; its hue may vary by source while its brightness and saturation support separation and harmony rather than becoming a forced white void, cream stationery, fixed series color, or unrelated pale stock;
- background effects, restrained edge registration, margins, and optical light paths make the composition feel unified and art-directed rather than like two unrelated images or a generic before/after template;
- the lower grade conveys large-format naturalism, monumental scale, restrained color, cool/warm separation, and deep readable contrast without becoming a generic teal-orange action look;
- the only default text is the exact small centered label “Kodak-2383” below the lower print; no other title, caption, comparison label, fake technical data, date, logo, or watermark appears;
- faces, hands, products, vehicles, and architecture retain credible geometry and texture;
- the image reads as a photograph with a cinematic print finish, not a regenerated scene or a poster;
- blacks feel dense but retain useful detail;
- highlights roll off smoothly without gray veiling or hard clipping;
- skin and source-critical colors remain credible;
- color separation is coherent and scene-specific, not a universal teal-orange wash;
- halation appears near genuinely bright, high-contrast edges and is warm, irregular, and subordinate, but remains visibly identifiable at normal viewing size in the balanced preset;
- daylight images retain a localized warm edge fringe plus restrained highlight diffusion rather than losing the film-light behavior entirely;
- the whole frame is not blurred, bloomed, hazed, or tinted red;
- grain is fine, nonuniform, and subordinate to image detail;
- no invented object or lettering appears inside either photograph; analog border, grain, and light-leak decoration stay restrained and outside the upper original image.

If one defining condition fails, regenerate once with a correction focused only on that failure. Treat panel geometry outside the ±1% tolerance as a defining failure. Do not generate minor variants unless the user requests exploration.

## Safety and privacy

- Do not browse for, upload, save, or share the user's source image elsewhere.
- Do not save source or generated images into project files unless requested.
- Do not infer or alter sensitive personal attributes.
- Preserve identity by default; change it only when explicitly requested.
