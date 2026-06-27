# GitHub Actions CI/CD Course for Beginners

## What This Repository Is For

This is the student repository for a 2-day beginner-friendly CI/CD course.

We will follow one simple story through the whole course:

1. code
2. verify
3. package
4. deliver

## How to Use This Repository During Class

- Open the section for the part of the course we are in now.
- Early labs are browser-first. You do not need local Git to start.
- Change one thing at a time, especially in YAML files.
- If a workflow fails, read the logs before changing more files.

## Core versus Optional

During the main course, focus on Labs `01` to `05`.

If you see workflows `05` or `06` in the `Actions` tab, treat them as optional and ignore them unless your instructor explicitly asks you to open them.

## Before Class

Use these files first:

1. [Git and GitHub Micro Prerequisites](docs/setup/00-git-and-github-micro-prerequisites.md)
2. [Create a GitHub Account](docs/setup/01-create-github-account.md)
3. [Create Your Course Repository from the Template](docs/setup/02-create-your-course-repo-from-template.md)
4. [Find the Actions Tab and Check Workflows](docs/setup/03-find-the-actions-tab-and-check-workflows.md)

## Day 1

Day 1 is about one question:

How do we know a change is still safe?

Open these files during Day 1:

1. [Course Story with Diagrams](docs/course-story/README.md)
2. [Lab 01: First Workflow](labs/LAB-01-first-workflow.md)
3. [How to Read Actions Logs](docs/help/01-how-to-read-actions-logs.md)
4. [Lab 02: Real CI Workflow](labs/LAB-02-real-ci-workflow.md)

Use these supporting pages only when you need them:

1. [Course Map](docs/00-course-map.md)
2. [Our Tiny Example App](docs/01-our-tiny-example-app.md)
3. [Runner Mental Model](docs/help/00-runner-mental-model.md)

## Day 2

Day 2 is about one question:

What do we deliver after the code is verified?

Open these files during Day 2:

1. [Artifacts, Images, and Containers](docs/02-artifacts-images-and-containers.md)
2. [Lab 03: Build Artifact Workflow](labs/LAB-03-build-artifact-workflow.md)
3. [Simulated Deployment](docs/03-simulated-deployment.md)
4. [Lab 04: Deploy Workflow](labs/LAB-04-deploy-workflow.md)
5. [Lab 05: Full CI/CD Flow](labs/LAB-05-full-cicd-flow.md)

## Optional Next Steps

Use these after the main course if you want a little more context:

1. [CI vs CD](docs/05-ci-vs-cd.md)
2. [YAML Cheatsheet for GitHub Actions](docs/help/04-yaml-cheatsheet.md)
3. [Runner Types](docs/help/05-runner-types.md)
4. [Trigger Reference](docs/help/06-trigger-reference.md)
5. [Finding and Reusing GitHub Actions](docs/help/07-finding-and-reusing-actions.md)
6. [Next Steps: Matrix and Secrets](docs/06-next-steps-matrix-and-secrets.md)
7. [Full Containerized CI/CD Example](docs/07-full-containerized-cicd-example.md)
8. [How ACR and AKS Fit the Story](docs/08-how-acr-and-aks-fit-the-story.md)
9. [91 OPTIONAL Example - Azure ACR and AKS Workflow](.github/workflows/06-azure-acr-aks-example.yml)
10. [Lab 06: Full Containerized CI/CD Pipeline](labs/LAB-06-full-containerized-cicd-pipeline.md)

## After Day 2

Use this page for a final review:

1. [Final Recap](docs/04-final-recap.md)

## If You Feel Stuck

Use these support files:

1. [Runner Mental Model](docs/help/00-runner-mental-model.md)
2. [How to Read Actions Logs](docs/help/01-how-to-read-actions-logs.md)
3. [Troubleshooting](docs/help/02-troubleshooting.md)
4. [Glossary](docs/help/03-glossary.md)
5. [YAML Cheatsheet for GitHub Actions](docs/help/04-yaml-cheatsheet.md)

## One Reminder

You do not need to memorize GitHub Actions syntax.

Keep returning to the main story:

1. code
2. verify
3. package
4. deliver
