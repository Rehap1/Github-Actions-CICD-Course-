# Next Steps: Matrix and Secrets

## Purpose

This page introduces two common GitHub Actions ideas that are useful after the beginner core of this course:

- matrix builds
- secrets management

These are next-step topics, not main course topics.

## Why These Topics Are Not in the Main Labs

The main course stays focused on one clear story:

1. code
2. verify
3. package
4. deliver

Matrix builds and secrets are valuable, but they add more moving parts.

It is better to learn them after the core story feels stable.

## Matrix Builds

### Short Answer

A matrix lets one workflow run the same job in multiple variations.

Examples:

- more than one Python version
- more than one operating system

### Why Teams Use It

It helps teams answer questions like:

- Does the app work on Python 3.11 and 3.12?
- Does the test suite pass on Linux and Windows?

### Small Example

```yaml
strategy:
  matrix:
    python-version: ["3.11", "3.12"]
```

That tells GitHub Actions to repeat the job for both values.

### What New Complexity It Adds

Matrix workflows are useful, but beginners now have to read:

- repeated jobs
- multiple logs
- failures in only one variation

That is why we did not put matrix builds in the main course labs.

## Secrets Management

### Short Answer

A secret is a sensitive value such as:

- API token
- password
- deployment key

In GitHub Actions, secrets should be stored in GitHub settings, not written directly in workflow files.

### Why Teams Need It

Real delivery workflows often need credentials.

Those credentials must be protected.

### Small Example

```yaml
env:
  API_TOKEN: ${{ secrets.MY_API_TOKEN }}
```

That means the value comes from GitHub's stored secrets.

### Beginner Safety Rules

- never write real secrets directly in the repository
- never commit passwords or tokens
- do not print secrets in logs
- treat secrets as protected inputs, not normal text values

## Environment Variables versus Secrets

Use this short rule:

- environment variable = normal configuration value
- secret = sensitive value that must be protected

## When to Learn These Next

Learn these after you are comfortable with:

- reading workflow runs
- understanding triggers
- understanding jobs and steps
- explaining the main CI/CD story

## Related Pages

- [CI vs CD](05-ci-vs-cd.md)
- [Trigger Reference](help/06-trigger-reference.md)
- [Finding and Reusing GitHub Actions](help/07-finding-and-reusing-actions.md)
- [Glossary](help/03-glossary.md)
- [Full Containerized CI/CD Example](07-full-containerized-cicd-example.md)
