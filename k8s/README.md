# Kubernetes setup

Build the images:

```bash
docker build -t pratice-backend:latest ./backend
docker build -t pratice-frontend:latest ./frontend
```

Apply the manifests:

```bash
kubectl apply -f k8s/backend.yaml
kubectl apply -f k8s/frontend.yaml
```

Check pods and services:

```bash
kubectl get pods
kubectl get svc
```

Open the frontend:

```text
http://localhost:30003
```

If you use Minikube, load the local images first:

```bash
minikube image load pratice-backend:latest
minikube image load pratice-frontend:latest
```
