# Full Containerized CI/CD Example

## Purpose

This page explains an optional fuller CI/CD example that is more similar to what teams often use in real work.

It is still simplified for this course.

## Why This Exists

The main course uses small separate workflows because that is the best way to teach beginners.

After that core path feels clear, it helps to see how the same story can appear in one larger workflow.

This workflow is manual-only on purpose so it does not distract from the core labs.

## What Makes This Example More Production-Like

This optional example adds a few ideas that are common in real pipelines:

- one workflow with multiple jobs
- explicit job order with `needs`
- a simple image tag based on date and run ID
- one artifact handoff between jobs
- a final deployment-style smoke test

## What We Still Keep Simple

To stay beginner-safe, we still avoid:

- cloud infrastructure
- Kubernetes
- real container registry credentials
- production secrets
- multiple services

That means the example is inspired by real patterns without becoming an enterprise operations lab.

If you want to see how the same story often grows into a cloud-shaped flow with ACR and AKS, use [How ACR and AKS Fit the Story](08-how-acr-and-aks-fit-the-story.md).

That page also points to a manual-only example workflow in `.github/workflows`.

## The Story in One Workflow

The workflow still follows the same course story:

1. verify the code
2. build the container image
3. save the image as an artifact
4. deliver the same image in a deployment simulation

## Why the Image Tag Matters

Real pipelines often create a clear image tag for traceability.

That helps answer:

- Which build created this image?
- Which exact package are we deploying?

In this optional example, the build job creates one simple date-plus-run-id tag and the deploy job uses that same tag.

## Why `needs` Matters

`needs` makes the workflow order explicit.

It says:

- do not build before verification finishes
- do not deploy before the container image exists

That makes the pipeline easier to trust and easier to read.

## Where Secrets Would Fit in Real Systems

In real projects, this kind of workflow often adds:

- container registry login
- deployment credentials
- environment-specific settings

Those values should come from GitHub secrets, not from files in the repository.

For this course, we stop before that point.

## What You Should Learn from This Example

The main lesson is not the exact YAML shape.

The main lesson is that even a fuller workflow is still telling the same story:

`code -> verify -> package -> deliver`

## Related Pages

- [LAB-06: Full Containerized CI/CD Pipeline](../labs/LAB-06-full-containerized-cicd-pipeline.md)
- [Final Assessment Support](assessment/README.md)
- [Next Steps: Matrix and Secrets](06-next-steps-matrix-and-secrets.md)
- [Simulated Deployment](03-simulated-deployment.md)
- [How ACR and AKS Fit the Story](08-how-acr-and-aks-fit-the-story.md)
