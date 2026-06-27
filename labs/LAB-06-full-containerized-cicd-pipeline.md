# LAB-06: Full Containerized CI/CD Pipeline

## Goal

Your goal is to run one fuller workflow that:

1. verifies the app
2. builds a Docker image
3. saves the image as an artifact
4. deploys the same image in a simulation

## Why This Lab Matters

The earlier labs split the story into smaller steps for learning.

This optional lab shows how the same story can appear in one larger workflow file.

## File for This Lab

Open this file in your repository:

`.github/workflows/05-full-containerized-cicd.yml`

## Before You Start

This is an optional advanced-beginner lab.

It is not part of the main Day 1 or Day 2 core lab path.

Do this after you are already comfortable with:

- `02 CI Workflow`
- `03 Build Artifact Workflow`
- `04 Deploy Workflow`

## Step 1: Read What the Workflow File Is Using

Before you run anything, look for these parts:

- `name` gives the workflow a title in the `Actions` tab
- `on` defines when the workflow runs
- `env` stores reusable values such as image name and app port
- `jobs` splits the work into clear stages
- `needs` makes the job order explicit
- `actions/upload-artifact` and `actions/download-artifact` move the built package between jobs
- Docker tags help the workflow refer to one built image clearly

This is the main YAML idea in this lab:

one workflow file can still tell the full CI/CD story as long as each job has a clear purpose.

## Step 2: Read the Workflow Shape

Open the workflow file and read the comments first.

Find these jobs:

- `verify`
- `build-container`
- `deploy-simulated`

Then find the `needs` lines.

## Step 3: Explain the Job Order

Before you run anything, try to explain the order:

1. tests run
2. the image is built and tagged
3. the image is saved as an artifact
4. the same built image is delivered

If you can say that, you already understand the main idea.

## Step 4: Read the Two Build Styles

In this course, you will now see two common container build shapes.

### Version 1: plain `docker build`

This is one plain `docker build` shape used in this repository:

```bash
docker build \
  -t "tiny-health-app:run-123" \
  -t "tiny-health-app:latest" \
  .
```

This is good for learning:

- build the image
- add tags
- save it as an artifact

In the core build workflow, the course keeps the tag story simpler and uses one traceable run tag.

In this optional fuller example, you also see `latest` so students can recognize a common real-world pattern.

### Version 2: `docker buildx build --push`

This is a common cloud-shaped version:

```bash
docker buildx build \
  --push \
  --tag "example.azurecr.io/tiny-health-app:run-123" \
  --tag "example.azurecr.io/tiny-health-app:latest" \
  .
```

This is good for showing:

- build the image
- tag it
- push it to a registry such as ACR

For this course, we run Version 1 and we only read Version 2 as an example.

## Step 5: Make One Safe Change

Open `app/app.py`.

Change only the human-readable text inside the `print(...)` line.

Keep the URL exactly the same.

Example:

```python
print("Tiny health server is ready on http://0.0.0.0:8000")
```

## Step 6: Commit the Change

Commit the change in GitHub with a simple message like:

`Update startup message for full containerized workflow`

## Step 7: Watch the Full Workflow Run

Open the `Actions` tab.

Open `90 OPTIONAL Full Containerized CI/CD Workflow`.

Open the newest run.

## Step 8: Follow the Jobs in Order

Check these jobs:

### `verify`

Confirm that the tests passed.

### `build-container`

Confirm that:

- the Docker image was built
- a simple image tag was created
- the image was tagged more than once
- the image artifact was uploaded

### `deploy-simulated`

Confirm that:

- the image artifact was downloaded
- the container started
- the smoke test passed

## Step 9: Read the Cloud-Shaped Example

Open this manual-only example workflow:

- [06-azure-acr-aks-example.yml](../.github/workflows/06-azure-acr-aks-example.yml)

Look for these steps:

- `Set up Docker Buildx`
- `Log in to ACR`
- `Build and push image with Docker Buildx`
- `Deploy image to AKS`

You are not required to run this workflow in class.

It is visible for learning, but it should be treated as an optional example unless your instructor explicitly asks you to open it.

You are using it to see how the same story grows in a more realistic pipeline.

## What You Should Notice

Even though this workflow is larger, the story is still the same:

- code change
- automated verification
- container build
- image tagging
- artifact handoff
- delivery of the same package

## How This Would Grow in a Cloud Example

In a more realistic cloud pipeline, the next steps often look like this:

1. verify the code
2. build the image
3. push the image to ACR
4. update AKS to use that image

That means:

- the beginner course uses a GitHub artifact to carry the package forward
- the cloud-shaped example uses ACR to carry the tagged container image forward
- AKS then runs that same pushed image

For this course, we stop before that point to keep the lab stable and beginner-friendly.

If you want to see that shape, read:

- [How ACR and AKS Fit the Story](../docs/08-how-acr-and-aks-fit-the-story.md)
- [06-azure-acr-aks-example.yml](../.github/workflows/06-azure-acr-aks-example.yml)

## If You Get Stuck

Check these things first:

1. confirm your code change only touched the print message
2. open the first failed job
3. open the first failed step
4. compare the workflow structure with the comments

Use these help pages if needed:

- [How to Read Actions Logs](../docs/help/01-how-to-read-actions-logs.md)
- [Troubleshooting](../docs/help/02-troubleshooting.md)
- [Full Containerized CI/CD Example](../docs/07-full-containerized-cicd-example.md)

## Success Check

You are done when:

- the workflow passes
- you can point to `verify`, `build-container`, and `deploy-simulated`
- you can explain why the deploy job used the built image artifact
- you can explain the difference between `docker build` and `docker buildx build --push`
- you can explain why `needs` makes the workflow order clear

## Reflection

After the lab, try to answer these questions:

- What made this workflow feel more production-like?
- Which parts were still the same as the smaller beginner workflows?
- Why is a simple image tag useful?
- Why might a real team push a tagged image to ACR?
- Why is it better to deploy the built image than to rebuild again later?
