# GitHub Action for SwiftLint

This Action executes [SwiftLint](https://github.com/realm/SwiftLint) and generates annotations from SwiftLint Violations.

## Usage

An example workflow(`.github/workflows/swiftlint.yml`) to executing SwiftLint follows:

```yaml
name: SwiftLint

on:
  pull_request:
    paths:
      - '.github/workflows/swiftlint.yml'
      - '.swiftlint.yml'
      - '**/*.swift'

jobs:
  SwiftLint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: GitHub Action for SwiftLint
        uses: norio-nomura/action-swiftlint@3.2.1
      - name: GitHub Action for SwiftLint with --strict
        uses: norio-nomura/action-swiftlint@3.2.1
        with:
          args: --strict
      - name: GitHub Action for SwiftLint (Only files changed in the PR)
        uses: norio-nomura/action-swiftlint@3.2.1
        env:
          DIFF_BASE: ${{ github.base_ref }}
      - name: GitHub Action for SwiftLint (Different working directory)
        uses: norio-nomura/action-swiftlint@3.2.1
        env:
          WORKING_DIRECTORY: Source
```

## Example
[Here](https://github.com/norio-nomura/test-action-swiftlint/pull/1/files) is an example that actually works.
![screenshot](screenshot.png)
