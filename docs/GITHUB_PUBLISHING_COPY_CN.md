# GitHub 发布文案

## 仓库名称

```text
kodak-2383-film-look
```

## About / Description

```text
A locked-layout 2383-inspired film-board Agent Skill for ChatGPT and Codex.
```

## 中文简介

```text
将用户照片制作成固定 1086×1449 版式的 2383-inspired 胶片印相板，支持原图取色背景、滚涂磨损纹理、乳剂边缘、局部双层光晕与系列一致性控制。
```

## Topics

```text
agent-skills
chatgpt-skills
codex-skills
image2
image-generation
film-look
kodak-2383
halation
cinematic-color-grading
imagemagick
```

## Release 标题

```text
Kodak 2383 Film Look Skill v1.0.0
```

## Release Notes

```markdown
Initial public release of the Kodak 2383 Film Look Agent Skill.

### Features

- Locked 1086×1449 film-board canvas
- Exact 810×624 upper source panel at x=139, y=101
- Exact 628×456 lower film panel at x=229, y=822
- Source-derived board colors with brushed and worn pigment texture
- Irregular emulsion overflow and short red/cyan registration shifts
- Scene-aware localized two-layer halation guidance
- Deterministic ImageMagick compositor
- Consistent geometry across photo series
- Optional classic full-frame grading mode

### Notes

This is an unofficial creative workflow. It is not an official Kodak LUT or a colorimetrically exact film emulation.
```

## 安装命令

```bash
npx skills add https://github.com/N1kO724/kodak-2383-film-look --skill kodak-2383-film-look
```

## 推荐置顶说明

```text
Please review SKILL.md and bundled scripts before installation. Do not publish source photographs or generated examples unless you own them or have permission to share them.
```

## Social Preview 建议

- 尺寸：1280×640 px
- 左侧：未经调色的横版照片
- 右侧：2383-inspired 调色版本
- 背景：从示例照片取色的低饱和滚涂纹理
- 标题：`2383 FILM PRINT LAB`
- 副标题：`LOCKED FILM-BOARD AGENT SKILL`
- 不使用 Kodak 官方 Logo，不模仿官方包装

