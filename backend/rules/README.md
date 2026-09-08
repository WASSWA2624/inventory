# Backend rules

The standardisation rules for the optional Tapture backend — the small server described in Part XI of the
specification, used only in team mode.

## Read this first

The backend is **optional, minimal and deliberately weak**. It exists to do five things the device cannot do for
itself: accounts, one organisation identity, roles, AI key custody and change relay. Everything else is a device
responsibility and stays one.

The device is the store of record. The server is transit, not truth. If a rule in this folder ever seems to conflict
with that, the rule is wrong.

## How to use them

- **Every rule has an identifier** (`BE-SEC-03`). Cite it in review.
- **Rules that protect the boundary** — 06-relay-and-retention and 07-ai-proxy — are not style preferences. Breaking
  one turns the product into something it deliberately is not.
- Backend dev-plan tasks (phase 25) cite the rule files that apply to them.

## The files

| File | Covers |
|---|---|
| [01-structure.md](01-structure.md) | Module layout, layering, where logic lives |
| [02-coding-standards.md](02-coding-standards.md) | TypeScript style, naming, errors, async |
| [03-api-design.md](03-api-design.md) | REST conventions, versioning, errors, pagination |
| [04-data-and-migrations.md](04-data-and-migrations.md) | Postgres, migrations, identifiers, retention columns |
| [05-security.md](05-security.md) | Authentication, tokens, secrets, input validation |
| [06-relay-and-retention.md](06-relay-and-retention.md) | The rules that keep the relay from becoming a backup |
| [07-ai-proxy.md](07-ai-proxy.md) | Key custody, payload handling, quotas |
| [08-observability.md](08-observability.md) | Logging discipline, metrics, audit |
| [09-testing.md](09-testing.md) | What is tested and how |
| [10-deployment.md](10-deployment.md) | Configuration, migrations, health, sizing |
| [11-workflow.md](11-workflow.md) | Branches, commits, review, dependencies |

## The four that outrank everything else

1. The server never holds a durable copy of a project. Packages are transient ciphertext, purged on acknowledgement
   or expiry.
2. The server never serves as backup. Backup is the user's manual export.
3. The server cannot read project content. Packages arrive encrypted and leave encrypted.
4. The application must remain fully usable when this server does not exist.
