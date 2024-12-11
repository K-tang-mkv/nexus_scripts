# nexus_scripts
### 如何运行：
1. 将脚本保存为 `.sh` 文件，例如 `start_containers.sh`。
2. 赋予执行权限：
   ```bash
   chmod +x start_containers.sh
   ```
3. 运行脚本：
   ```bash
   ./start_containers.sh
   ```

### 示例：

假设你想创建 5 个容器，每个容器需要 3 核心和 4GB 内存，运行脚本后，输入如下：

```
请输入你的 prover-id: 1234
请输入你要生成的容器数量（默认8个）： 5
请输入每个容器需要的CPU核心数（默认2个核心）： 3
请输入每个容器需要的内存大小（默认2GB）： 4g
```

这样就会启动 5 个容器，每个容器分配 3 核心和 4GB 内存。
