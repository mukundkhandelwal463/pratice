# Jenkins setup

This project includes a root `Jenkinsfile`.

The pipeline does:

1. Checks out the repository
2. Builds backend and frontend Docker images
3. Validates `docker-compose.yml`
4. Runs `terraform fmt -check` for Terraform folders that exist
5. Applies `k8s/deployment.yml` to Kubernetes
6. Waits for Kubernetes rollouts

Jenkins machine requirements:

- Docker
- Docker Compose
- kubectl
- Terraform
- Access to your Kubernetes cluster

For Docker Desktop Kubernetes, make sure Jenkins runs on the same machine where Docker Desktop Kubernetes is enabled.

Create a Jenkins Pipeline job and point it to this repository. Jenkins will automatically use:

```text
Jenkinsfile
```

If you only want build/test and do not want Jenkins to deploy to Kubernetes, remove or comment out the `Deploy To Kubernetes` stage.
