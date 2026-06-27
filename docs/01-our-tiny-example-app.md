# Our Tiny Example App

## Purpose

This course uses one very small Python application.

We keep it small on purpose so you can focus on CI/CD, not on application complexity.

## What the App Does

The app has one simple endpoint:

- `/health`

When the app is running and you open `/health`, it returns a small JSON response:

```json
{"status": "ok"}
```

That is enough for us to practice:

1. writing code
2. testing code
3. packaging the app
4. delivering the same package

## Why This App Is Small

This app is intentionally tiny because:

- you do not need much programming knowledge to follow it
- we can explain every file quickly
- workflow behavior stays more important than app behavior

## Files That Matter Right Now

- `app/app.py` contains the application code
- `tests/test_app.py` contains the tests
- `Dockerfile` contains the packaging instructions

## Optional: Run the App Locally

Running the app locally is optional for this course.

If Python 3 is already available on your laptop, you can try it.

If not, you can skip this section and continue with the GitHub Actions labs.

If you are not sure what is expected on your laptop, go back to [Git and GitHub Micro Prerequisites](setup/00-git-and-github-micro-prerequisites.md).

From the repository root, run:

```bash
python3 app/app.py
```

Then open this address in your browser:

`http://127.0.0.1:8000/health`

You should see:

```json
{"status": "ok"}
```

## Optional: Run the Tests Locally

If Python 3 is already available on your laptop, you can also run the tests locally.

If not, the CI workflow will run the tests for you in GitHub Actions.

Your instructor may skip this local path completely.

From the repository root, run:

```bash
python3 -m unittest discover -s tests -v
```

## What We Will Do Next

Later in the course, we will use this same tiny app for:

- a first workflow
- a real CI workflow
- a build workflow
- a deploy workflow
- one full CI/CD flow lab

The app stays almost the same.

The automation around it is what will grow.
