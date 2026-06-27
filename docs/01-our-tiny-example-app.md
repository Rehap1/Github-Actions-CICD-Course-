# Our Tiny Example App

## Purpose

This course uses one very small Python application.

We keep it small on purpose so you can focus on CI/CD, not on application complexity.

## What the App Does

The app stays tiny, but it now gives us three useful endpoints:

- `/health`
- `/version`
- `/status`

`/health` stays the smallest signal:

```json
{"status": "ok"}
```

`/version` is useful later when we want to see which build reached a deployment target.

`/status` is useful later when we want to see simple runtime details such as:

- commit SHA
- deployment timestamp
- hostname
- environment
- image tag

The app also includes one small debug switch:

- `FORCE_UNHEALTHY=false` by default

If that value is set to `true`, `/health` returns an unhealthy response on purpose.

That gives the course one safe way to demonstrate smoke-test and deployment-failure behavior without changing the app code permanently.

That is enough for us to practice:

1. writing code
2. testing code
3. packaging the app
4. delivering the same package
5. proving what was deployed later

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

Then open one of these addresses in your browser:

`http://127.0.0.1:8000/health`

or

`http://127.0.0.1:8000/status`

You should see JSON output.

For `/health`, it should look like this:

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
- one final deployment assessment

The app stays almost the same.

The automation around it is what will grow.
