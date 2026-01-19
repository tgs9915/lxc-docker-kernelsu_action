## 问题分析
GitHub Action工作流在运行时遇到404错误，无法下载以下两个脚本：
- https://github.com/fate-think/LXC-DOCKER-KernelSU_Action/releases/download/1.0.0/add-lxc-docker-custom.sh
- https://github.com/fate-think/LXC-DOCKER-KernelSU_Action/releases/download/1.0.0/runcpatch.sh

## 解决方案
1. **创建缺失的脚本文件**：
   - 在项目根目录创建`add-lxc-docker-custom.sh`脚本，用于配置LXC-Docker支持
   - 在项目根目录创建`runcpatch.sh`脚本，用于添加runc补丁

2. **修改GitHub Action工作流**：
   - 更新所有工作流文件，将脚本下载地址从外部Release改为项目内部文件
   - 确保脚本具有可执行权限

## 实施步骤
1. 创建`add-lxc-docker-custom.sh`脚本
2. 创建`runcpatch.sh`脚本
3. 修改所有`.github/workflows/`目录下的工作流文件，将脚本下载命令替换为直接使用项目内的脚本
4. 测试修改后的工作流是否能正常运行

## 预期结果
- GitHub Action工作流不再出现404错误
- 脚本能正常执行，为内核添加LXC-Docker支持和runc补丁
- 内核编译过程顺利完成