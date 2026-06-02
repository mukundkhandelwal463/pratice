# AWS EC2 Terraform setup

This creates one Ubuntu EC2 instance and installs Docker plus Docker Compose through user data.

Create a variables file:

```bash
copy terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` and set your existing EC2 key pair name:

```hcl
key_name = "your-existing-key-pair-name"
```

Run Terraform:

```bash
terraform init
terraform plan
terraform apply
```

SSH into the instance:

```bash
ssh -i <your-key.pem> ubuntu@<public-ip>
```

Then copy or clone your app onto the EC2 instance and run:

```bash
docker compose up --build -d
```

Destroy the EC2 resources when finished to avoid AWS charges:

```bash
terraform destroy
```
