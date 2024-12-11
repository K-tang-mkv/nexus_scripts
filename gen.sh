#!/bin/bash

# 拉取所需镜像
docker pull sillintang/nexus:latest

# 让用户输入 prover-id
read -p "请输入你的 prover-id: " prover_id

# 让用户选择容器数量（默认8个）
read -p "请输入你要生成的容器数量（默认8个）： " container_count
container_count=${container_count:-8}  # 如果没有输入，默认为8

# 让用户选择每个容器的 CPU 核心数（默认2核）
read -p "请输入每个容器需要的CPU核心数（默认2个核心）： " cpus
cpus=${cpus:-2}  # 如果没有输入，默认为2核

# 让用户选择每个容器的内存大小（默认2GB）
read -p "请输入每个容器需要的内存大小（默认2GB）： " memory
memory=${memory:-2g}  # 如果没有输入，默认为2GB

# 使用循环启动指定数量的容器
for i in $(seq 1 $container_count); do
  # 创建容器并运行
  docker run -d --cpus="$cpus" -m "$memory" --name nexus-container-$i sillintang/nexus:latest bash -c "
    # 创建 .nexus 目录（如果不存在）
    mkdir -p ~/.nexus

    # 将 prover-id 写入文件
    echo '$prover_id' > ~/.nexus/prover-id
    
    cd ~/.nexus/network-api/clients/cli
    # 执行 prover 命令并将日志输出到 log 文件
    nohup ./target/release/prover -- beta.orchestrator.nexus.xyz > log &
    
    tail -f /dev/null
  "
done

echo "创建成功"

