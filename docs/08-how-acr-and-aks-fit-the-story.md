# How ACR and AKS Fit the Story

## Purpose

This page shows how the same CI/CD story can extend to a cloud-shaped workflow.

This is an example page, not a core beginner lab.

It is also not the standardized assessment path for this course.

Do not run the Azure example workflow unless your instructor explicitly asks you to.

## Why This Page Exists

Some students want to see how the course workflow ideas connect to real cloud delivery work.

This page gives that bridge without turning the course into an Azure operations class.

## The Story Stays the Same

Even with ACR and AKS, the story is still:

1. code
2. verify
3. package
4. deliver

## What Changes in the Cloud-Shaped Version

The delivery side becomes a little more realistic:

- the image is pushed to a container registry
- the deployment system uses that pushed image
- the cluster updates the running app

## Two Common Build Command Shapes

In this project, it helps to recognize two very common patterns.

### 1. Build and tag with `docker build`

This is one simple `docker build` shape used in this repository:

```bash
docker build \
  -t "tiny-health-app:2026-04-08-123456789" \
  -t "tiny-health-app:latest" \
  .
```

This shape teaches:

- build the image
- add one or more tags
- keep the image inside the workflow runner
- save it as a GitHub artifact if needed

In the core build workflow, we keep the tag story very simple and use one date-plus-run-id tag.

In the optional fuller example, you can also see a `latest` tag added for comparison.

### 2. Build, tag, and push with `docker buildx build --push`

This is a common cloud-shaped version:

```bash
docker buildx build \
  --push \
  --tag "example.azurecr.io/tiny-health-app:2026-04-08-123456789" \
  --tag "example.azurecr.io/tiny-health-app:latest" \
  .
```

This shape teaches:

- build the image
- tag it clearly
- push it to a registry such as ACR
- let a deployment system pull or use that same image later

## What ACR Means Here

ACR is Azure Container Registry.

In this story, it is the place where the built container image is stored.

Use this short rule:

- workflow artifact = saved output inside GitHub Actions
- ACR image = pushed container image stored in a registry

For a beginner, both are ways of carrying forward the packaged output.

In the main course labs, we carry the package forward with a GitHub Actions artifact.

In the Azure-shaped example, we carry the package forward by pushing the image to ACR.

| Course shape | What carries the packaged output forward |
|---|---|
| beginner core labs | GitHub Actions artifact |
| Azure-shaped example | pushed image in ACR |

## What AKS Means Here

AKS is Azure Kubernetes Service.

In this story, it represents the place where the packaged app is deployed and updated.

You do not need Kubernetes details for this course.

The beginner idea is enough:

- CI verifies the change
- the container image is built
- the image is pushed to ACR
- AKS is updated to use that image

## Manual-Only Example Workflow

Open this workflow file to see a sanitized example:

- [06-azure-acr-aks-example.yml](../.github/workflows/06-azure-acr-aks-example.yml)

It is visible in the `Actions` tab, but it does not trigger automatically.

It is still optional and should be ignored during the core labs unless your instructor says otherwise.

## How to Read the Example Workflow

Read it in this order:

### `verify`

This part is normal CI.

It checks out the repository, sets up Python, and runs the tests.

This should feel familiar from the main course.

### `build-and-push-image`

This part is the packaging step plus registry upload.

Look for these ideas:

- one simple image tag is created from the date and run ID
- the workflow logs in to ACR
- the image is built
- the image is pushed to ACR

This is the cloud-shaped version of carrying forward the packaged output.

### `deploy-to-aks`

This part is the delivery step.

Look for these ideas:

- the workflow logs in to Azure
- the workflow connects to the AKS cluster
- `kubectl set image` updates the deployment to the new image
- `kubectl rollout status` checks whether the update finished

You do not need to know Kubernetes details.

The main beginner idea is enough:

the cluster is told to run the exact image that was already built.

## What to Look for in the Example

Look for these three jobs:

- `verify`
- `build-and-push-image`
- `deploy-to-aks`

Then notice these ideas:

- `needs` keeps the order clear
- the image tag is created once
- ACR login uses secrets
- AKS deployment uses the pushed image
- the pushed image replaces the simpler GitHub-only artifact handoff from the beginner labs

## What This Example Is Not Trying to Teach

This page is not trying to teach:

- Azure account setup
- registry administration
- Kubernetes objects
- cluster networking
- production secrets management in depth

The main value is seeing how the course story grows into a more realistic delivery pipeline.

Even though the workflow file is visible in the repository, it is still an example workflow.

It is not part of the core beginner path.

## Short Beginner Summary

Use this sentence:

"In a larger real system, the built image may be pushed to ACR and then AKS may be updated to run that same image."

## Related Pages

- [Full Containerized CI/CD Example](07-full-containerized-cicd-example.md)
- [Next Steps: Matrix and Secrets](06-next-steps-matrix-and-secrets.md)
- [Trigger Reference](help/06-trigger-reference.md)
