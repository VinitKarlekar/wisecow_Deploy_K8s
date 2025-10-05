# Wisecow Containerization and Deployment Plan

## 1. Dockerization
- [x] Dockerfile is present and ready (ubuntu base, installs cowsay, fortune, netcat, copies wisecow.sh)

## 2. Kubernetes Deployment
- [x] Fix deployment.yaml: Change liveness and readiness probes from httpGet to tcpSocket for port 4499
- [x] Update deployment.yaml: Change image to ghcr.io/vinit/wisecow:latest
- [x] Create k8s/secret.yaml: TLS secret from tls.crt and tls.key
- [x] Test local deployment on Minikube

## 3. CI/CD
- [x] Create .github/workflows/ci-cd.yml: Build and push Docker image on push
- [x] Add deployment job: Apply Kubernetes manifests (requires kubeconfig secret)
- [ ] Ensure repo is public (manual step)

## 4. TLS
- [x] Ingress configured for TLS with wisecow.local
- [x] Secret created from files

## 5. Testing
- [x] Build Docker image locally
- [x] Deploy to Minikube and test access via ingress with TLS
