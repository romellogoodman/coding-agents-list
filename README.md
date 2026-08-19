# coding-agents-list

A curated list of open-source coding agents, plus a one-command way to clone them all locally.

Every entry is verified against its GitHub repo (source actually present, OSI license, actively maintained). Clones go into `agents/`, which is gitignored — this repo tracks the *list*, never the code it points to.

## The list

| Agent | Repo | License | What it is |
|---|---|---|---|
| OpenCode | [anomalyco/opencode](https://github.com/anomalyco/opencode) | MIT | Terminal-first TUI coding agent; 75+ providers, LSP, MCP. Formerly `sst/opencode`. |
| Codex CLI | [openai/codex](https://github.com/openai/codex) | Apache-2.0 | OpenAI's local coding agent for the terminal (Rust, sandboxed). |
| Gemini CLI | [google-gemini/gemini-cli](https://github.com/google-gemini/gemini-cli) | Apache-2.0 | Google's terminal agent for Gemini; MCP, search grounding, free tier. |
| Pi | [earendil-works/pi](https://github.com/earendil-works/pi) | MIT | Minimal agent toolkit + coding CLI: unified LLM API, agent loop, TUI. Formerly `badlogic/pi-mono`. |
| Aider | [Aider-AI/aider](https://github.com/Aider-AI/aider) | Apache-2.0 | AI pair programming in the terminal; git-native multi-file edits. |
| Deep Agents | [langchain-ai/deepagents](https://github.com/langchain-ai/deepagents) | MIT | LangChain's batteries-included agent harness with a coding CLI. |
| Qwen Code | [QwenLM/qwen-code](https://github.com/QwenLM/qwen-code) | Apache-2.0 | Alibaba's terminal agent tuned for Qwen coder models (Gemini CLI fork). |
| Grok Build | [xai-org/grok-build](https://github.com/xai-org/grok-build) | Apache-2.0 | xAI's coding agent harness with a fullscreen, mouse-interactive TUI. |
| Prime Agent | [PrimeIntellect-ai/prime-agent](https://github.com/PrimeIntellect-ai/prime-agent) | MIT | Self-improving RLM agent for coding workflows and long autonomous runs. |
| Kimi CLI | [MoonshotAI/kimi-cli](https://github.com/MoonshotAI/kimi-cli) | Apache-2.0 | Moonshot AI's CLI coding agent; skills + MCP. |
| Mistral Vibe | [mistralai/mistral-vibe](https://github.com/mistralai/mistral-vibe) | Apache-2.0 | Mistral's minimal CLI coding agent. |
| Tau | [huggingface/tau](https://github.com/huggingface/tau) | MIT | Hugging Face's Python port of Pi's minimalist coding agent. |
| DeepSeek Harness | [deepseek-ai/deepseek-harness](https://github.com/deepseek-ai/deepseek-harness) | MIT | DeepSeek's open-source agent harness ("everything is a plugin"); CLI + web UI. Developer preview. |
| bb | [get-bb/bb](https://github.com/get-bb/bb) | MIT | Agentic IDE that builds itself; desktop/web/CLI/API surfaces, orchestrates other coding agents. |
| fx | [vercel-labs/fx](https://github.com/vercel-labs/fx) | Apache-2.0 | Tiny, open, embeddable, native coding agent from Vercel Labs (~6 MB binary). [fx.sh](https://fx.sh) |

The machine-readable version of this table is [`agents.tsv`](agents.tsv) — that's what the clone script reads.

## Get them all locally

```sh
./clone.sh              # shallow-clone everything into agents/ (re-run to pull updates)
./clone.sh aider pi     # just some of them (names = first column of agents.tsv)
FULL=1 ./clone.sh       # full git history instead of --depth 1
```

Each agent lands in `agents/<name>/` as a normal git checkout, so you can `cd` in and follow its own README to build or run it. Re-running the script fast-forwards existing clones and clones anything new in the manifest.

`agents/` is in `.gitignore`. Nothing under it will ever show up in `git status`.

## Adding an agent

1. Add a tab-separated row to `agents.tsv`: `name`, repo URL, license, one-line description. `name` becomes the folder under `agents/`.
2. Add the matching row to the table above.
3. Run `./clone.sh <name>` to check it clones.

Criteria for inclusion: the repo contains the actual source (not just an installer or issue tracker), the license is OSI-approved, and the project is actively maintained.
