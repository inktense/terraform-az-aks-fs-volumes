# terraform-az-aks-fs-volumes
K8s cluster deployed on Azure using File Storage as volume.

## Prerequisites

To use this repository, you need to have the following:

- An Azure account.
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/get-started-with-azure-cli).
- [Azure Storage Account](https://learn.microsoft.com/en-us/azure/storage/common/storage-introduction).
- [kubectl](https://kubernetes.io/docs/tasks/tools/) installed on your local machine.
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) installed on your local machine.

## Deployment

Before deploying make sure you are logged into Azure:
```bash
az login
```
To deploy the AKS cluster follow the steps below:
- Open a terminal and provision the infrastructure with Terraform by running the following commands:
```bash
cd terraform

terraform init
terraform apply
```
- Next we need to configure your computer to communicate with the newly created cluster by running the following command:
```bash
az aks get-credentials --resource-group dev --name aks-fs
```

### Deploying the K8s objects

<b>For dynamic provisioning we will use the dp directory:</b>

```bash 
k apply -f k8s/dp/sc.yaml 

k get sc
```
We can now setup the rest of the objects:
```bash 
k apply -f k8s/dp 
```
Test the pod with the following command:
```bash
kubectl exec -ti efs-app-1 -- tail -f /data/out

Fri Apr 28 11:06:02 UTC 2023
Fri Apr 28 11:06:07 UTC 2023
Fri Apr 28 11:06:12 UTC 2023
Fri Apr 28 11:06:17 UTC 2023
```

-  [Resource](https://learn.microsoft.com/en-us/azure/developer/terraform/create-k8s-cluster-with-tf-and-aks) for AKS.
-  [Resource](https://learn.microsoft.com/en-us/azure/aks/azure-csi-files-storage-provision) for Azure Files.
-  https://learn.microsoft.com/en-us/azure/aks/operator-best-practices-storage
  