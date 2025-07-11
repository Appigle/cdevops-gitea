#!/bin/bash

set -e

echo "🔍 Checking for Homebrew..."
if ! command -v brew &>/dev/null; then
  echo "❌ Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew is installed."
fi

echo "🍺 Updating Homebrew..."
brew update

echo "🐳 Installing Docker Desktop (macOS GUI app)..."
# brew install --cask docker

echo "🧰 Installing CLI tools: kubectl, helm, minikube, ansible..."
brew install \
  kubectl \
  helm \
  minikube \
  ansible

echo "✅ CLI tools installed."

echo "🚀 Starting Docker Desktop..."
open -a Docker

echo "⏳ Waiting for Docker to start..."
while ! docker system info &>/dev/null; do
  sleep 2
done
echo "✅ Docker is running."

echo "🌐 Starting Minikube..."
minikube start --driver=docker

echo "✅ Kubernetes cluster is running:"
kubectl get nodes

echo "🎉 Bootstrap complete. You're ready to go!"

echo " verifying everything is working"
docker ps
kubectl get ns
helm version
ansible-playbook --version