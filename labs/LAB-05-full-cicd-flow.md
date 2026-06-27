# LAB-05: Full CI/CD Flow

## Goal

Your goal is to follow one small code change through the full course story:

1. code
2. verify
3. package
4. deliver

If you notice optional workflows in the `Actions` tab, ignore them during this lab unless your instructor asks you to open them.

## Why This Lab Matters

The earlier labs taught the pieces one by one.

This lab connects them into one GitHub Actions experience.

## Files for This Lab

Open these files in your repository:

- `app/app.py`
- `.github/workflows/02-ci.yml`
- `.github/workflows/03-build-artifact.yml`
- `.github/workflows/04-deploy.yml`

## What These Workflow Files Are Teaching

In this lab, each workflow has one clear role:

- `02-ci.yml` verifies the code with tests
- `03-build-artifact.yml` creates and saves the package
- `04-deploy.yml` delivers the saved package and runs a smoke test

That is why this lab is useful:

you can see the same story across multiple small workflows.

## Step 1: Read the Workflow Comments First

Open the three workflow files and read the comments at the top and above the steps.

You should be able to answer:

- which workflow verifies the change
- which workflow creates the package
- which workflow delivers the saved package

## Step 2: Make One Safe Code Change

Open `app/app.py`.

Find the `print(...)` line near the bottom of the file.

Change only the human-readable message text.

Keep the URL exactly the same.

For example, you can change the line to:

```python
print("Server is ready on http://0.0.0.0:8000")
```

## Step 3: Commit the Change

Commit the change in GitHub with a simple message like:

`Update server startup message`

## Step 4: Watch the CI Workflow

Open the `Actions` tab.

Open the newest run of `02 CI Workflow`.

Confirm that:

- the workflow started because of your code change
- the `Run tests` step passed

## Step 5: Start the Build Workflow

Still in the `Actions` tab, open `03 Build Artifact Workflow`.

Use `Run workflow` to start it manually.

Wait for it to pass.

## Step 6: Watch the Deploy Workflow

After the build workflow succeeds, open `04 Deploy Workflow`.

You should see a new deploy run start automatically.

Open it and confirm that the smoke test passes.

## Step 7: Tell the Story in Your Own Words

Using the three runs you just saw, explain the story like this:

1. my code change triggered CI
2. CI verified the change with tests
3. the build workflow created the package
4. the deploy workflow used that same package

## What You Should Notice

This is the main course goal:

GitHub Actions is helping you move a change through a full CI/CD path.

The point is not memorizing YAML.

The point is understanding what each workflow adds to the story.

## If You Get Stuck

Check these things first:

1. confirm your code change only changed the print message text
2. confirm `02 CI Workflow` passed before you start the build workflow
3. confirm `03 Build Artifact Workflow` passed before you look for deploy
4. open the first failed step before changing more files

Use these help pages if needed:

- [How to Read Actions Logs](../docs/help/01-how-to-read-actions-logs.md)
- [Troubleshooting](../docs/help/02-troubleshooting.md)

## Success Check

You are done when:

- your code change triggers `02 CI Workflow`
- `02 CI Workflow` passes
- `03 Build Artifact Workflow` passes
- `04 Deploy Workflow` starts automatically and passes
- you can explain `code -> verify -> package -> deliver`

## Reflection

After the lab, try to answer these questions:

- What did CI add to the story?
- What did the build workflow add?
- Why did deploy use the saved artifact instead of rebuilding?
- Which part of GitHub Actions now feels more familiar than it did on Day 1?
