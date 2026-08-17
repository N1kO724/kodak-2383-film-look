# Kodak 2383 Film Look Skill
<img width="1086" height="1450" alt="71cf38043f0668a8355045743f735d45" src="https://github.com/user-attachments/assets/9e550a16-d8e0-4203-bbb1-dfa40d45da6c" />

一个面向 ChatGPT、Codex 与兼容 Agent Skills 工具的视觉处理 Skill。它将用户照片制作成固定 **1086×1449 px** 的纵向胶片印相板：上方保留未经调色的原始裁切，下方使用 Image 2 生成 2383-inspired 电影印相效果，并通过确定性脚本锁定系列版式。

> 这是非官方的视觉创作工具，不是 Kodak 官方 LUT，也不提供色彩科学意义上的精确胶片仿真。

## 主要能力

- 固定 1086×1449 px 输出画布
- 上图固定 810×624 px，坐标 x=139、y=101
- 下图固定 628×456 px，坐标 x=229、y=822
- 每张作品根据原图提取背景色，不使用固定底色
- 背景具有滚涂、擦拭、颜料堆积与轻微磨损纹理
- 下图具有不规则乳剂溢色、红青套色偏移、化学潮线和局部漏光
- 根据真实高光位置生成局部双层 halation，而非全局泛光
- 支持多张照片的统一系列处理
- 支持用户明确要求时的经典全画幅调色模式

## 仓库结构

```text
kodak-2383-film-look-github/
├── README.md
├── LICENSE
├── TRADEMARK_NOTICE.md
├── .gitignore
├── docs/
│   └── GITHUB_UPLOAD_GUIDE_CN.md
└── skills/
    └── kodak-2383-film-look/
        ├── SKILL.md
        ├── agents/openai.yaml
        ├── scripts/compose_locked_board.sh
        ├── references/look-system.md
        └── assets/
            ├── icon.svg
            ├── board-smear-texture.png
            └── lower-emulsion-edge.png
```

## 安装

### 方式一：npx skills

```bash
npx skills add https://github.com/N1kO724/kodak-2383-film-look --skill kodak-2383-film-look
```

### 方式二：ChatGPT 上传

下载仓库 ZIP，解压后进入 `skills/kodak-2383-film-look/`，将该完整目录重新压缩为 ZIP，然后在 ChatGPT 中选择：

`插件 → Skill → 创建 → 从电脑上传`

上传前应自行检查 `SKILL.md`、脚本和资产。Skill 可以包含指令、支持文件和可执行代码。

### 方式三：手动安装到 Codex

把 `skills/kodak-2383-film-look` 完整复制到本地 Skills 目录，保持内部相对路径不变。不要只复制 `SKILL.md`。

## 使用示例

```text
使用 $kodak-2383-film-look 将我上传的照片制作成固定版式的胶片印相板，
增强真实高光区域的胶片光晕，并保持人物、文字和建筑结构不变。
```

```text
按照当前规则批量处理这组照片，所有成品的上下图片尺寸和坐标必须严格一致。
```

## 运行依赖

- 支持 Agent Skills 的 ChatGPT、Codex 或兼容运行环境
- 可用的图像生成能力（该 Skill 默认使用内置 Image 2）
- ImageMagick，需提供 `convert` 与 `identify` 命令
- Bash
- 系统字体 `DejaVu-Serif`，或在合成脚本中替换为可用字体

## 设计边界

- 使用 “2383-inspired” 或 “2383 print-film character” 描述结果
- 不宣称生成 Kodak 官方 LUT 或 Blackmagic 官方仿真
- 不适用于精确 LUT 制作、确定性像素级调色、视频批处理或其他胶片型号
- 默认不改变人物身份、文字内容、产品结构、车辆比例和建筑几何

## 发布前验证

```bash
python3 /path/to/skill-creator/scripts/quick_validate.py \
  skills/kodak-2383-film-look
```

并使用一组测试图运行 `scripts/compose_locked_board.sh`，确认输出尺寸为 `1086x1449`。

完整上传流程见 [docs/GITHUB_UPLOAD_GUIDE_CN.md](docs/GITHUB_UPLOAD_GUIDE_CN.md)，可直接复制的仓库简介、Topics 与 Release 文案见 [docs/GITHUB_PUBLISHING_COPY_CN.md](docs/GITHUB_PUBLISHING_COPY_CN.md)。

## License

MIT License。商标说明见 [TRADEMARK_NOTICE.md](TRADEMARK_NOTICE.md)。
