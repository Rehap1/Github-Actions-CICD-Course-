# How the Current Labs Prepare You

## Purpose

This page shows how the existing labs and exercises already prepare you for the final assessment.

## Readiness Map

| Existing item | What it teaches | Why it matters for the final assessment |
|---|---|---|
| `LAB-02: Real CI Workflow` | verification with tests | the assessment workflow still starts by proving the change is safe |
| `EX-05: Build Artifact with Buildx` | reusable container build actions | the assessment workflow can reuse the same clearer build action shape |
| `LAB-03: Build Artifact Workflow` | packaging and traceable image tags | the assessment workflow still creates one clear image tag and one deployable package |
| `LAB-04: Deploy Workflow` | deliver the built package and smoke-test it | the assessment workflow still deploys and checks the running app |
| `EX-07: Deploy and Inspect the Deployment` | inspect a running deployment more carefully | the assessment still asks you to prove what is running after deploy |
| `LAB-05: Full CI/CD Flow` | end-to-end reasoning across multiple workflows | the final assessment still asks you to explain the full story, not just one command |
| `EX-10: PR-Based CI/CD with Branch Protection` | deployment readiness as a team rule | it reinforces that delivery should happen only after a trusted verification path |
| `LAB-06: Full Containerized CI/CD Pipeline` | one fuller verify-build-deploy workflow | this optional lab is the closest preview of the assessment workflow shape |

## What the Final Assessment Adds

The final assessment adds only a few new ideas:

- push the image to Docker Hub
- use SSH to reach a real Ubuntu VM
- pull the exact image on that VM
- prove what was deployed with `/health`, `/version`, and `/status`

## How the Earlier Labs Support the Assessment

These ideas stay useful in the final assessment:

- `LAB-02` still prepares verification first
- `LAB-04` still prepares delivery and validation thinking
- `LAB-05` still prepares end-to-end reasoning
- `EX-10` still prepares the idea that trusted delivery follows a trusted path

The assessment is prepared directly by the current labs because `LAB-03`, `LAB-04`, and `EX-05` already use image packaging ideas.

## Main Lesson

The final assessment is not a new story.

It is the same story with one more realistic delivery target:

`code -> verify -> package -> deliver`

## If You Need a Quick Review

If one part of the final assessment feels shaky, go back to the matching earlier lab:

- review `LAB-02` if verification steps or test runs still feel fuzzy
- review `LAB-03` if image tags or packaged output still feel fuzzy
- review `LAB-04` if deploy steps or smoke tests still feel fuzzy
- review `LAB-05` if the full story still feels broken into separate pieces
