# GitHub 上传与发布流程

以下流程默认仓库地址为：

`https://github.com/N1kO724/kodak-2383-film-look`

如果使用其他仓库名，请同步替换 README 中的安装地址。

## 一、发布前准备

1. 确认仓库中只包含可公开内容。
2. 不要上传用户原始照片、生成缓存、测试输出或聊天记录。
3. 检查 `skills/kodak-2383-film-look/SKILL.md` 的 YAML 头部只包含 `name` 与 `description`。
4. 保持 `scripts/`、`references/`、`assets/`、`agents/` 的相对目录不变。
5. 确认脚本无本机绝对路径、账号、Token 或内部文件标识。
6. 运行 Skill 校验和至少一次代表性合成测试。

## 二、在 GitHub 网页创建仓库

1. 登录 GitHub。
2. 点击右上角 `+` → `New repository`。
3. Repository name 填写：`kodak-2383-film-look`。
4. Description 建议填写：

   `A locked-layout 2383-inspired film-board Agent Skill for ChatGPT and Codex.`

5. 选择 `Public`；如果暂时只做内部测试，可先选 `Private`。
6. 不要勾选自动创建 README、.gitignore 或 License，因为发布包已经包含这些文件。
7. 点击 `Create repository`。

## 三、使用命令行上传

进入解压后的仓库根目录：

```bash
cd kodak-2383-film-look-github
git init
git branch -M main
git add .
git commit -m "Release kodak-2383-film-look skill v1.0.0"
git remote add origin https://github.com/N1kO724/kodak-2383-film-look.git
git push -u origin main
```

如果 GitHub 要求认证，使用浏览器授权、GitHub CLI 或 Personal Access Token；不要把 Token 写入仓库文件或命令历史截图。

## 四、使用 GitHub Desktop 上传

1. 解压发布包。
2. 打开 GitHub Desktop。
3. 选择 `File → Add local repository`。
4. 如果提示当前目录不是仓库，选择创建仓库。
5. Repository name 填写 `kodak-2383-film-look`。
6. 提交信息填写 `Release v1.0.0`。
7. 点击 `Publish repository`。
8. 根据需要取消或保留 `Keep this code private`。

## 五、发布 Release

上传完成后：

1. 打开仓库页面。
2. 点击右侧 `Releases` → `Draft a new release`。
3. Tag 填写 `v1.0.0`。
4. Release title 填写 `Kodak 2383 Film Look Skill v1.0.0`。
5. Release notes 建议填写：

```text
Initial public release.

- Locked 1086×1449 film-board layout
- Exact upper and lower panel geometry
- Source-derived textured board colors
- Localized two-layer halation guidance
- Deterministic ImageMagick compositor
- Batch-series consistency rules
```

6. 可附上本发布 ZIP，但不要附带用户照片或生成缓存。
7. 点击 `Publish release`。

## 六、安装验证

在一台未安装该 Skill 的环境中执行：

```bash
npx skills add https://github.com/N1kO724/kodak-2383-film-look --skill kodak-2383-film-look
```

验证以下内容：

- 安装器能找到 `kodak-2383-film-look`
- `SKILL.md` 可以触发
- `assets/` 中两张 PNG 材质存在
- `scripts/compose_locked_board.sh` 可执行
- 生成的成品尺寸为 1086×1449
- 上图尺寸为 810×624，下图尺寸为 628×456
- 批量生成时每张图坐标一致

## 七、ChatGPT 上传验证

OpenAI 官方说明支持在 Skill 页面选择“创建 → 从电脑上传”。为了避免把仓库层级文档一起安装，建议：

1. 进入 `skills/kodak-2383-film-look/`。
2. 选中该目录中的全部内容并压缩为 ZIP。
3. 在 ChatGPT 中打开 `插件 → Skill → 创建 → 从电脑上传`。
4. 上传后检查是否被标记为可用、待审核或阻止。
5. 首次测试使用一张不含隐私信息的照片。

## 八、安全与开源检查

发布前执行：

```bash
git status --short
git ls-files
git grep -nE '(api[_-]?key|token|password|secret|libfile_|file_000000|/workspace/|/root/)'
```

如果最后一条命令命中内容，应逐项确认并删除任何凭证、内部文件标识或本机路径。文档中的通用占位路径不属于敏感信息，但不应出现真实运行路径。

## 九、建议的版本管理

- `v1.0.0`：当前固定版式公开版
- `v1.0.1`：文档、措辞或小错误修复
- `v1.1.0`：新增可选版式、强度预设或新的边缘资产
- `v2.0.0`：改变默认版式、坐标、触发逻辑或不兼容的目录结构

每次发布前都应重新校验 Skill、运行合成测试并检查安装流程。

