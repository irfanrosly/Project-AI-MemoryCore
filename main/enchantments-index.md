# Enchantments Index — Quick Reference
*Compact trigger map. Friday: proactively suggest when context matches.*

## Active Enchantments

| Skill | Trigger Phrases | When to Suggest |
|-------|----------------|-----------------|
| `debug` | `debug this`, `why broken`, `stuck on this`, `bug hunt`, `nothing works` | User describes broken behavior or error |
| `pr` | `create PR`, `branch this`, `write changelog`, `prep release` | User wants to commit, push, or create a PR |
| `perf` | `optimize this`, `why slow`, `perf review` | User mentions slowness, performance, bundle size |
| `trace` | `trace this`, `how does X work`, `safe to delete` | User wants to understand code flow or impact |
| `spec` | `spec this`, `break this down`, `requirements for X` | User defining a feature or asking where to start |
| `build` | `build this component`, `scaffold this`, `create this component` | User wants a new React/Next.js component |
| `frontend` | `frontend review`, `check this component`, `UI review` | User wants component quality audit |
| `principles` | `apply SOLID`, `DRY this`, `refactor this` | User wants code quality improvement |
| `blueprint` | `blueprint this`, `architect this`, `plan this project` | User designing a new system or full project |
| `api` | `design this API`, `new Payload collection`, `API endpoint` | User building API or Payload CMS collection |
| `testing` | `write tests`, `test this`, `TDD this` | User wants test coverage or TDD approach |
| `sight` | `diagram this`, `visualize` | User wants a Mermaid diagram |
| `seal` | `seal this`, `commit this` | User wants a conventional commit message |
| `scan` | `scan this`, `estimate this` | User wants project scope or pricing estimate |
| `prism` | `prism this`, `devil's advocate` | User wants multi-perspective analysis |
| `mirror` | `mirror mode`, `honest feedback` | User wants personal reflection or honest critique |
| `spec` | `spec this`, `break this down` | User wants feature breakdown |
| `ideas` | `save idea`, `water the garden` | User has an idea to capture |
| `quill` | `quill mode`, `write this for me` | User needs writing help |
| `eclipse` | `eclipse this`, `log incident` | User hit a production incident or bug RCA |
| `amber` | `amber this`, `save visual` | User wants to save a design/screenshot reference |
| `familiar` | `dispatch agent`, `run in parallel` | User needs multi-agent coordination |
| `forge` | `create enchantment`, `level up` | User wants to build a new skill |
| `shard` | `shard this` | File > 1000 lines, needs splitting |
| `grimoire` | `save library`, `search library` | User saving or finding knowledge patterns |
| `work` | `load plan`, `resume plan` | User resuming a saved plan |
| `project` | `new project`, `load project` | User starting or switching projects |
| `shopping` | `outfit idea`, `add to wardrobe` | User discussing clothing or style |
| `lullaby` | `goodnight`, `I'm done for today` | End of day wind-down |
| `bond` | `bond check`, identity challenge | Identity verification needed |

## Friday: Proactive Suggestion Rule
When Irfan's message matches a "When to Suggest" context above, say:
`→ [skill-name] enchantment available. Type "[trigger phrase]" to activate.`
Keep it one line. Don't activate without being asked — just surface it.
