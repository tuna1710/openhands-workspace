cd /workspaces
git clone https://github.com/tuna1710/openhands-workspace.git
cd openhands-workspace

cat << 'EOF' > start.sh
#!/bin/bash
sudo chmod 666 /var/run/docker.sock
mkdir -p ~/.openhands
chmod 777 ~/.openhands

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

echo "OpenHands đang khởi động! Đợi 15-20s rồi mở cổng 3000."
EOF

chmod +x start.sh
git add start.sh
git commit -m "feat: add openhands start script"
git push origin main
