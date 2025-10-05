# Cow wisdom web server

## Prerequisites

```
sudo apt install fortune-mod cowsay -y
```

## How to use?

1. Run `./wisecow.sh`
2. Point the browser to server port (default 4499)

## What to expect?
![wisecow](https://github.com/nyrahul/wisecow/assets/9133227/8d6bfde3-4a5a-480e-8d55-3fef60300d98)

# Problem Statement
Deploy the wisecow application as a k8s app

## Requirement
1. Create Dockerfile for the image and corresponding k8s manifest to deploy in k8s env. The wisecow service should be exposed as k8s service.
2. Github action for creating new image when changes are made to this repo
3. [Challenge goal]: Enable secure TLS communication for the wisecow app.

## Expected Artifacts
1. Github repo containing the app with corresponding dockerfile, k8s manifest, any other artifacts needed.
2. Github repo with corresponding github action.
3. Github repo should be kept private and the access should be enabled for following github IDs: nyrahul

## Implementation Status

All requirements from the assignment have been successfully implemented and are working locally using Minikube on Docker. The deployment configuration is set up for local Kubernetes environments. For production deployment on cloud platforms like EKS or Azure, additional configuration may be needed, but the core containerization, Kubernetes manifests, CI/CD pipeline, and TLS support are fully functional.

### Artifacts Implemented
- **Dockerfile**: Containerizes the Wisecow application with all dependencies.
- **Kubernetes Manifests**:
  - `k8s/deployment.yaml`: Deploys the app with proper probes and image reference.
  - `k8s/service.yaml`: Exposes the app as a ClusterIP service.
  - `k8s/ingress.yaml`: Provides ingress with TLS support for secure communication.
  - `k8s/secret.yaml`: Contains the TLS certificate and key.
  - `k8s/kubearmor-policy.yaml`: Zero-trust security policies using KubeArmor.
- **GitHub Actions Workflow** (`.github/workflows/ci-cd.yml`): Automates build, push to GHCR, and deployment.
- **TLS Implementation**: Secure HTTPS communication via NGINX ingress with self-signed certificate.
- **Additional Scripts**: System health monitor and app health checker scripts.

### Local Deployment Steps
1. Start Minikube: `minikube start`
2. Enable ingress: `minikube addons enable ingress`
3. Apply manifests: `kubectl apply -f k8s/`
4. Port-forward or use tunnel: `minikube tunnel`
5. Access via `https://wisecow.local` (add to /etc/hosts: `127.0.0.1 wisecow.local`)


