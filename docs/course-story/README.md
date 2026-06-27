# Course Story with Diagrams

## Purpose

This page tells the course story in a visual way.

Use it at the beginning of the course, during the recap, or whenever you want to reconnect the ideas.

## The Big Idea

This course is not mainly about GitHub Actions syntax.

It is about learning one delivery story:

1. code
2. verify
3. package
4. deliver

## The Real-World Problem

Without CI/CD, teams often face problems like these:

- code works on one laptop but not another
- checks are skipped when time is short
- packaging is done differently each time
- deployment depends on memory
- problems are discovered too late

```mermaid
flowchart LR
    A["Code Change"] --> B["Manual Checks"]
    B --> C["Inconsistent Results"]
    B --> D["Late Feedback"]
    B --> E["Risky Delivery"]
```

CI/CD exists to reduce those problems.

## The Main Course Story

```mermaid
flowchart LR
    A["Code"] --> B["Verify"]
    B --> C["Package"]
    C --> D["Deliver"]
```

Use this short explanation:

- code = we make or update the software
- verify = we check whether the change is still safe
- package = we create the output we want to carry forward
- deliver = we use that same package in the next step

## How the Two Days Connect

```mermaid
flowchart LR
    A["Day 1<br/>Confidence After Change"] --> B["Day 2<br/>Package and Delivery"]
    A --> C["Why CI exists"]
    A --> D["GitHub Practices and Branching"]
    A --> E["Workflow, Job, Step, Trigger, Runner"]
    A --> F["First Workflow"]
    A --> G["Real CI Workflow"]
    B --> H["Artifacts"]
    B --> I["Image vs Container"]
    B --> J["Build Workflow"]
    B --> K["Deploy Workflow"]
    B --> L["Full CI/CD Story"]
```

Day 1 answers:

`How do we know a change is still safe?`

Day 1 also builds the language needed for the labs:

- GitHub standard practices and a simple branching strategy
- workflow structure and trigger choices
- jobs, steps, actions, and environment variables
- where `matrix`, `needs`, and `secrets` fit as later exercise or next-step ideas

Day 2 answers:

`What do we deliver after the code is verified?`

## How GitHub Actions Fits the Story

GitHub Actions is the tool we use to express the process.

```mermaid
flowchart TB
    A["Workflow"] --> B["Job"]
    B --> C["Step 1"]
    B --> D["Step 2"]
    B --> E["Step 3"]
    F["Runner"] --> B
```

Use this short mental model:

- workflow = the full automation plan
- job = one group of work
- step = one action inside the job
- runner = the machine doing the work

## The Workflow Story in This Course

```mermaid
flowchart LR
    A["01 Hello Workflow"] --> B["02 CI Workflow"]
    B --> C["03 Build Artifact Workflow"]
    C --> D["04 Deploy Workflow"]
    D --> E["LAB-05 Full CI/CD Flow"]
```

Each workflow adds one idea:

- `01 Hello Workflow` shows the shape of a workflow run
- `02 CI Workflow` shows automated verification
- `03 Build Artifact Workflow` shows packaging and artifact creation
- `04 Deploy Workflow` shows delivery using the saved package
- `LAB-05` connects the full story end to end

## How the Built Package Moves Forward

```mermaid
flowchart LR
    A["03 Build Artifact Workflow"] --> B["Build tagged image"]
    B --> C["Save image as artifact"]
    C --> D["04 Deploy Workflow"]
    D --> E["Load same tagged image"]
    E --> F["Run smoke test"]
```

This is the Day 2 promise:

- build creates the package
- the package is saved
- deploy uses that same package

## Factory and Shipping Analogy

If the course feels abstract, use this analogy:

```mermaid
flowchart LR
    A["Design Change"] --> B["Quality Check"]
    B --> C["Pack the Product"]
    C --> D["Ship the Product"]
```

For this course:

- code = the design change
- verify = the quality check
- package = preparing the product for shipment
- deliver = shipping and using that prepared product

Important note:

The analogy helps explain the flow.

The real course terms still matter:

- workflow
- job
- step
- runner
- artifact
- image
- container

## What Success Looks Like

By the end of the course, students should be able to explain:

- why CI exists
- why verification and packaging are different
- why deployment should use the saved package
- how the full story connects from change to delivery

## Short Version to Remember

If you forget everything else, remember this:

```mermaid
flowchart LR
    A["Change"] --> B["Confidence"]
    B --> C["Package"]
    C --> D["Delivery"]
```

Or even shorter:

`code -> verify -> package -> deliver`

## Related Pages

- [Course Map](../00-course-map.md)
- [Our Tiny Example App](../01-our-tiny-example-app.md)
- [Final Recap](../04-final-recap.md)
