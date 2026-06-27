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

### Practice Path

If you want to build a small matrix exercise yourself in this repository, continue with:

- [EX-03: CI Matrix](../exercises/EX-03-ci-matrix.md)

That exercise keeps the trigger manual-only and repeats the CI test job for:

- Python `3.11`
- Python `3.12`

### Advanced Practice Pattern: Matrix Values From One Secret

For a more advanced build-it-yourself pattern, continue with:

- [EX-04: CI Secrets and Matrix Patterns](../exercises/EX-04-ci-secrets-and-matrix.md)

This example shows a useful GitHub Actions limitation and workaround:

- `secrets` cannot be used directly inside `strategy.matrix`
- a first job reads the secret
- that job passes a normal output forward
- the matrix job uses that output with `fromJSON(...)`

Simple way to read the workflow:

- first job: prepare the version list
- second job: run the same CI test flow once per version

Expected secret format:

```json
["3.11","3.12"]
```

Important teaching note:

For normal values like Python versions, a repository variable or workflow input is usually a better fit than a secret.

This example is useful mainly for understanding how GitHub Actions contexts and job outputs work.

This is a useful pattern exercise, not the recommended default for normal non-sensitive configuration.

### Smarter Fixed-Matrix Pattern: Secret Lookup

The same `EX-04` exercise also includes a second build-it-yourself pattern:

This version uses a different idea:

- the matrix entries stay fixed in the workflow
- each matrix entry holds the name of a secret
- the workflow reads the real version with `secrets[matrix.version_secret]`

Why this is useful:

- it is simpler than the two-job workaround
- it works well when you already know the small fixed set of matrix runs
- it still teaches a useful GitHub Actions expression pattern

Important difference:

- use the `from-secret` workflow when the whole matrix list must come from one secret
- use the `secret-lookup` workflow when the matrix is already known and each job just needs to read a different secret

Prepared solution workflows for these patterns live only in the instructor repository.

This is also a useful pattern exercise, not the recommended default for normal non-sensitive configuration.

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

## Variables, Environment Variables, and Secrets

Use this short rule:

- GitHub Actions variable = normal configuration value stored in repository settings
- environment variable = reusable value written inside the workflow YAML
- secret = sensitive value that must be protected

Examples of values that usually fit `vars` better than `secrets`:

- port numbers
- image names
- Python base image tags

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
