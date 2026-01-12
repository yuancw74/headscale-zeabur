# 使用官方镜像作为基础
FROM headscale/headscale:latest AS source

# 使用 alpine 作为最终运行环境（包含 sh 和基础工具）
FROM alpine:latest

# 从官方镜像中拷贝二进制文件
COPY  --from=source /ko-app/headscale /bin/

# 暴露端口
EXPOSE 8080

# 启动命令
ENTRYPOINT ["/bin/headscale"]
CMD ["serve"]
