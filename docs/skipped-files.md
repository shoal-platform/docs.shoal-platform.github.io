# Skipped Files on Upload

When you upload a folder directly, Shoal automatically strips out files and folders that don't belong in a deployed container - things like dependencies, build artefacts, caches, and editor config. This keeps uploads fast and your container clean.

!!! info "Zip uploads too"
    The same skip rules apply when uploading a zip file. Matched files and folders are removed before your code is sent to the build pipeline.

---

## Skipped folders

Folders are skipped if any part of their path matches a name in this list. For example, `src/__pycache__/` is skipped because the segment `__pycache__` matches.

=== ":material-cog: General"

    | Folder | Reason |
    |---|---|
    | `.git` | Git history - not needed at runtime |
    | `.github` | CI/CD workflow config |
    | `.idea` | JetBrains IDE config |
    | `.vscode` | VS Code editor config |
    | `dist` | Build output - rebuilt by Docker |
    | `build` | Build output - rebuilt by Docker |

=== ":simple-nodedotjs: Node.js"

    | Folder | Reason |
    |---|---|
    | `node_modules` | Dependencies - reinstalled by `npm install` in Docker |
    | `.next` | Next.js build cache |
    | `.nuxt` | Nuxt build cache |
    | `.turbo` | Turborepo cache |
    | `coverage` | Test coverage output |
    | `.nyc_output` | NYC/Istanbul coverage data |

=== ":simple-python: Python"

    | Folder | Reason |
    |---|---|
    | `.venv` | Virtual environment - recreated in Docker |
    | `venv` | Virtual environment - recreated in Docker |
    | `env` | Virtual environment - recreated in Docker |
    | `__pycache__` | Compiled bytecode cache |
    | `.pytest_cache` | Pytest run cache |
    | `.mypy_cache` | Mypy type-check cache |
    | `.ruff_cache` | Ruff linter cache |
    | `htmlcov` | HTML coverage report output |

=== ":simple-go: Go / :simple-php: PHP"

    | Folder | Reason |
    |---|---|
    | `vendor` | Vendored dependencies - reinstalled in Docker |

=== ":fontawesome-brands-java: Java / :simple-kotlin: Kotlin"

    | Folder | Reason |
    |---|---|
    | `target` | Maven build output |
    | `.gradle` | Gradle cache |
    | `out` | IntelliJ build output |

=== ":simple-dotnet: C#"

    | Folder | Reason |
    |---|---|
    | `bin` | Compiled binaries |
    | `obj` | Intermediate build files |
    | `.vs` | Visual Studio local config |
    | `packages` | NuGet package cache |
    | `TestResults` | Test run output |

=== ":simple-ruby: Ruby"

    | Folder | Reason |
    |---|---|
    | `.bundle` | Bundler config and cached gems |
    | `tmp` | Rails temp files |
    | `log` | Rails log files |

=== ":simple-elixir: Elixir"

    | Folder | Reason |
    |---|---|
    | `_build` | Mix build output |
    | `deps` | Mix dependencies - fetched in Docker |
    | `.elixir_ls` | ElixirLS language server data |
    | `cover` | ExCoveralls coverage output |

---

## Skipped files

Exact filename matches that are always removed:

| File | Reason |
|---|---|
| `.DS_Store` | macOS folder metadata |
| `Thumbs.db` | Windows thumbnail cache |
| `.env` | Environment secrets - configure via Env / Settings instead |
| `.env.*` | Environment secret variants (e.g. `.env.local`, `.env.production`) |

---

## Skipped file types

Files are also skipped based on their extension:

| Extension | Type |
|---|---|
| `.log` | Log files |
| `.tmp` | Temporary files |
| `.pyc` | Python compiled bytecode |
| `.pyo` | Python optimised bytecode |
| `.class` | Java compiled class files |
| `.war` | Java web archive |
| `.pdb` | .NET debug symbols |
| `.tsbuildinfo` | TypeScript incremental build info |
| `.gem` | Ruby gem packages |

---

!!! warning "Something missing from your deployment?"
    If a file you expect to be present isn't making it into your container, the skip logic may be the cause. Check this list first - if your file matches a skipped folder name, filename, or extension, rename or restructure it to avoid the match.
