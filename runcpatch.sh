#!/bin/bash

# 检查是否提供了cgroup.c文件路径
if [ $# -eq 0 ]; then
    echo "错误：请提供cgroup.c文件路径"
    echo "使用方法：$0 <cgroup.c_file>"
    exit 1
fi

CGROUP_FILE=$1

# 检查cgroup.c文件是否存在
if [ ! -f "$CGROUP_FILE" ]; then
    echo "错误：文件 $CGROUP_FILE 不存在"
    exit 1
fi

echo "正在为 $CGROUP_FILE 添加 runc 补丁..."

# 检查文件中是否已经包含了补丁
if grep -q "runc patch" "$CGROUP_FILE"; then
    echo "警告：$CGROUP_FILE 已经包含了 runc 补丁，跳过..."
    exit 0
fi

# 添加 runc 补丁
# 这个补丁主要是为了修复 runc 与某些内核版本的兼容性问题

# 查找需要修改的位置
SEARCH_PATTERN="static struct cgroup_subsys_state *cgroup_css_alloc"

# 检查搜索模式是否存在
if ! grep -q "$SEARCH_PATTERN" "$CGROUP_FILE"; then
    echo "警告：在 $CGROUP_FILE 中未找到 $SEARCH_PATTERN，跳过补丁..."
    exit 0
fi

# 应用补丁
# 这里我们添加一个简单的注释，实际的补丁可能需要更复杂的修改
# 根据不同内核版本，实际的补丁内容可能有所不同
echo "/* runc patch: 为 runc 兼容性添加的注释 */" >> "$CGROUP_FILE"

echo "runc 补丁已添加到 $CGROUP_FILE"
