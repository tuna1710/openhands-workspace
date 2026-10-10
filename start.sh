#!/bin/bash
set -e

echo "=== Đang khởi động OpenHands Workspace ==="

# 1. Cấp quyền truy cập Docker socket
sudo chmod 666 /var/run/docker.sock 2>/dev/null || true

# 2. Tạo thư mục cấu hình OpenHands
mkdir -p ~/.openhands
chmod 777 ~/.openhands 2>/dev/null || true

# 3. Dừng container cũ nếu đang chạy
docker rm -f openhands-app 2>/dev/null || true

# 4. Khởi chạy OpenHands container
docker run -d \
    -e AGENT_SERVER_IMAGE_REPOSITORY=ghcr.io/openhands/agent-server \
    -e AGENT_SERVER_IMAGE_TAG=1.36.0-python \
    -e LOG_ALL_EVENTS=true \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ~/.openhands:/.openhands \
    -v "$PWD":/workspace/project \
    -p 3000:3000 \
    --add-host host.docker.internal:host-gateway \
    --name openhands-app \
    docker.openhands.dev/openhands/openhands:latest

echo ""
echo "=========================================================="
echo " OpenHands đang khởi động ngầm!"
echo " Vui lòng đợi khoảng 15-20 giây rồi mở cổng 3000."
echo "=========================================================="
