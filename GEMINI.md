## Gemini Configuration for SQL_Fundamentals

This file contains project-specific configurations and memories for the Gemini CLI.

### Custom Commands

*   **/sync**: 
    1.  Run `git status` to identify new or modified files.
    2.  Interactively stage changes (`git add -p`) or restrict scope (`git add src/ sql/ docs/`).
    3. Abort if any staged path matches a deny-list pattern (e.g. `*.env`, `*.sqlite`, `*.key`).
    4.  Run `git diff --staged` to show the user the changes.
    5.  Read the content of the staged files.
    6.  Generate a concise, descriptive commit message based on the file contents (without mentioning 'Gemini').
    7.  Show the user the proposed commit message for approval.
    8.  Once approved, commit the changes, push the commit to the default remote and branch, and delete any temporary files used in the process.

### Project-Specific Preferences

*   **Pre-commit Hooks**: Do not run `pre-commit` hooks in this repository as it is a SQL practice repository.
