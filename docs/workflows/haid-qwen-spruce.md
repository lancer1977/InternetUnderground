# HAID Qwen Spruce Workflow

Use a local coding model to draft or refine visual cleanup work before applying changes by hand.

## Purpose

The goal is to offload repetitive page-spruce work while keeping human control over the final diff.

## Recommended model

- Use a local coding model such as Qwen Coder or a comparable code-focused model.
- Keep the model focused on one page or one asset family at a time.
- If `ollama` is not installed locally, the helper scripts can fall back to the
  Docker-based Ollama runtime.

## Suggested loop

1. Pick a narrow target page or asset family.
2. Ask the model for a read-only review of readability problems.
3. Ask for a minimal CSS or asset cleanup proposal.
4. Apply the change in the repo manually.
5. Check the page locally and keep the original archive intact.

## Batch mode

For multiple pages, use `scripts/qwen-spruce-batch.sh` with a target list such as
`docs/workflows/haid-targets.txt`. Each target should be one repo-relative file
path per line.

## Good prompts

- "Review this page for readability issues on modern monitors."
- "Suggest a minimal CSS pass that keeps the archive look but improves line length and spacing."
- "Identify which images on this page are candidates for AI cleanup or upscaling."
- "Propose a safe original-vs-derived asset naming scheme for this folder."
- "Inspect this page and produce a minimal responsive CSS patch."

## Guardrails

- Do not let the model rewrite archive copy.
- Do not replace originals in place.
- Prefer one page, one asset family, or one folder per run.
- Treat the model output as a draft, not as source of truth.

## Notes

If a background runner is added later, this document should become its operating contract.
