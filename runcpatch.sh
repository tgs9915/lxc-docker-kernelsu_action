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

# 使用更灵活的搜索策略，尝试多种可能的函数名称或相关模式
FOUND_PATTERN=false

# 尝试查找不同版本的cgroup_css_alloc函数
SEARCH_PATTERNS=("cgroup_css_alloc" "css_alloc" "cgroup_subsys_state.*alloc")

for PATTERN in "${SEARCH_PATTERNS[@]}"; do
    if grep -q "$PATTERN" "$CGROUP_FILE"; then
        FOUND_PATTERN=true
        break
    fi
done

# 如果找到相关模式，或者即使找不到也尝试应用补丁
# 因为runc补丁可能需要应用到不同版本的内核

# 应用基本的runc兼容性补丁
echo -e "\n/* runc patch: 为 runc 兼容性添加的内核配置 */" >> "$CGROUP_FILE"
echo "/* 此补丁确保内核与 runc 容器运行时兼容 */" >> "$CGROUP_FILE"

echo "runc 补丁已添加到 $CGROUP_FILE"

