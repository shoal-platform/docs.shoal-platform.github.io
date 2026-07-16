# Shoal Docs (source)

Source for the public Shoal documentation at **[docs.shoalstack.com](https://docs.shoalstack.com)**.
Built with [MkDocs](https://www.mkdocs.org/) + the [Material](https://squidfunk.github.io/mkdocs-material/) theme.

> **Two repos.** This repo is the **source** (Markdown). The built static site is published from a
> separate repo, `shoal-platform.github.io` (GitHub Pages, `CNAME` → `docs.shoalstack.com`).
> You edit here; `./deploy.sh` builds and pushes to that repo. **Never hand-edit the output repo** —
> it is overwritten on every deploy.

## Layout

| Path | What |
|---|---|
| `docs/` | The pages (one `.md` per page) + `docs/assets/` (logo, screenshots) + `docs/stylesheets/extra.css` |
| `mkdocs.yml` | Site config: theme, plugins, markdown extensions, and the `nav` (sidebar order) |
| `requirements.txt` | Pinned Python deps (MkDocs, Material, plugins) |
| `deploy.sh` | Build + publish to the live Pages repo |

## Setup (once)

Needs Python 3. Create the virtualenv the tooling expects (`myenv/`, gitignored) and install deps:

```bash
python3 -m venv myenv
source myenv/bin/activate
pip install -r requirements.txt
```

Activate `myenv` in **each new shell** before running `mkdocs` (or `deploy.sh`) — otherwise you'll hit
`ERROR - Config value 'plugins': The "glightbox" plugin is not installed` because the system `mkdocs`
doesn't have the plugins from `requirements.txt`. Check with `which mkdocs` — it should point inside
`myenv/bin/`, not `/opt/homebrew/bin` or `/usr/bin`.

## Run locally (live preview)

```bash
source myenv/bin/activate   # from the repo root; needed once per shell
mkdocs serve
```

Opens a hot-reloading server at <http://127.0.0.1:8000> — edit a `.md` and the browser refreshes.

## Build

```bash
source myenv/bin/activate   # if not already active in this shell
mkdocs build
```

Renders the static site into `site/` (gitignored). You rarely need this by hand — `deploy.sh` does it.

## Test

There is no unit-test suite; "testing" the docs = a clean **strict** build. Strict mode turns broken
internal links, missing nav targets, and other warnings into errors:

```bash
source myenv/bin/activate   # if not already active in this shell
mkdocs build --strict
```

Run this before deploying. Known-OK warnings: image references to screenshots you haven't captured yet
(they 404 until the PNG is added to `docs/assets/screenshots/`).

## Add or edit a page

1. Add/edit a Markdown file under `docs/`.
2. Register it in the `nav:` tree in `mkdocs.yml` (order there = sidebar order).
3. `mkdocs serve` to preview, then `mkdocs build --strict` to check.

Conventions used across pages: start with a single `#` H1 + a short intro paragraph; `!!! note/tip/warning`
admonitions; `=== "Tab"` tabbed blocks (with `:material-*:` / `:simple-*:` icons); relative links to other
pages (`[text](other-page.md)`); external links get `{ target="_blank" }`; images live in
`assets/screenshots/` and are click-to-zoom via the glightbox plugin.

## Deploy (publish to docs.shoalstack.com)

**Commit your source changes here first**, then run the deploy script:

```bash
# 1. commit the Markdown/config changes in THIS repo
git add .
git commit -m "docs: <what changed>"
git push

# 2. build + publish to the live Pages repo
./deploy.sh -m "docs: <what changed>"
```

`deploy.sh -m "<message>"` (message required):

1. activates `myenv` and runs `mkdocs build`,
2. copies `site/*` into the sibling `../shoal-platform.github.io/` repo,
3. `git add` / `commit -m "<message>"` / `push` there.

GitHub Pages then serves the new build at **docs.shoalstack.com** within a minute or so.

> The sibling `../shoal-platform.github.io` repo must be checked out next to this one for `deploy.sh`
> to find it.
