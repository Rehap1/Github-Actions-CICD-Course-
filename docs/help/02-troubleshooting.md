# Troubleshooting

## Purpose

This file helps you recover from the most common beginner problems in the course.

Use it as a quick checklist, not as something you need to memorize.

## Start Here

Use this order when you feel stuck:

1. identify which workflow or lab you are in
2. open the workflow run
3. use [How to Read Actions Logs](01-how-to-read-actions-logs.md)
4. return here for the matching recovery section

If you want the full help index first, open [Help Guide](README.md).

## I Cannot Find the `Actions` Tab

Try these checks:

1. make sure you are in your own repository
2. open the main repository page
3. widen the browser window
4. check the overflow menu if tabs are hidden

## I Changed a Workflow File but No Run Appeared

Check these things first:

1. confirm you committed the change
2. refresh the `Actions` page
3. confirm you edited the correct workflow file
4. confirm you are looking at the correct repository

## My Workflow Failed

Use this order:

1. open the workflow run
2. open the failed job
3. open the failed step
4. read the first useful error message

Do not change many files before you understand the failed step.

## My YAML Looks Broken

Common YAML problems:

- wrong indentation
- missing `:`
- editing the wrong line
- moving text left or right by accident

Best recovery step:

Compare your file with the course example and change only one thing at a time.

If you need a structure reminder, use [YAML Cheatsheet for GitHub Actions](04-yaml-cheatsheet.md).

## I Cannot Tell Whether My Commit Happened

Check these things:

1. look at the repository history
2. confirm your commit message appears
3. go back to the changed file and confirm the new content is visible

## The CI Workflow Failed

First ask:

- Did the tests run?
- Which step turned red?
- Did I change app behavior or only safe text?

In Lab 02, the safest recovery is to compare `app/app.py` with the course example.

## The Build Workflow Failed

First ask:

- Did the tests pass?
- Did the Docker build step fail?
- Did the artifact upload step fail?

For this course, ask your instructor for help before changing the Dockerfile a lot.

## The Deploy Workflow Did Not Start

Check these things:

1. make sure the build workflow passed
2. refresh the `Actions` page
3. open `04 Deploy Workflow`

## I See Extra Workflows in the `Actions` Tab

That can happen because the repository also contains later optional example workflows and one later final assessment prep workflow.

Exercise workflow solutions are not preloaded in the student repo anymore.

Most exercises now modify a workflow file that already exists from the lab.

For the main course, focus on:

- `01 Hello Workflow`
- `02 CI Workflow`
- `03 Build Artifact Workflow`
- `04 Deploy Workflow`

If you are in the main course labs, focus on the four core workflows first and ignore later optional examples unless your instructor tells you to use them.

The final assessment prep workflow is preloaded later in the course.

The final assessment workflow itself is not preloaded in the student repo.

You create it yourself later only if your instructor starts the final assessment.

## The LAB-07 Readiness Workflow Failed

Start with these checks:

1. confirm all required GitHub secrets exist
2. confirm SSH login works from your own machine first
3. confirm the VM is reachable on port `8000`
4. confirm Docker is installed on the VM
5. open the first failed step before changing more setup items

This workflow is only a setup check.

It should not build or deploy the final solution.

If it fails, also use:

- [Final Assessment Support Overview](../assessment/README.md)
- [Prepare the Ubuntu VM](../assessment/02-prepare-ubuntu-vm.md)
- [Configure Docker Hub, SSH, and GitHub Secrets](../assessment/03-configure-secrets-and-ssh.md)
- [LAB-07: Final Assessment Setup and Validation Prep](../../labs/LAB-07-docker-hub-vm-deploy.md)
- [Assessment Success Criteria, Validation, and Rubric](../assessment/05-success-criteria-and-rubric.md)

## The EX-11 Final Assessment Workflow Failed

If you are already in the assessed exercise, start with the same checks above and then continue with:

- [EX-11: Final Deployment Assessment](../../exercises/EX-11-final-deployment-assessment.md)

## I Accidentally Ran an Optional Workflow

That is recoverable.

Do this:

1. stop changing files for that optional workflow
2. go back to the workflow or lab your instructor is teaching now
3. continue with the core lab steps

Ask your instructor for help only if the accidental run is blocking your current lab.

## I Am Confused About Image versus Container

Use this short rule:

- image = packaged app
- container = running app from that package

That is enough for this course.

## I Feel Lost

Return to the main course story:

1. code
2. verify
3. package
4. deliver

Then ask:

"Which part of the story am I in right now?"

## Related Help

- [Runner Mental Model](00-runner-mental-model.md)
- [How to Read Actions Logs](01-how-to-read-actions-logs.md)
- [Glossary](03-glossary.md)
- [YAML Cheatsheet for GitHub Actions](04-yaml-cheatsheet.md)
