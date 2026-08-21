# Connect Your AI Assistant (MCP)

Shoal runs a **Model Context Protocol (MCP)** server, so you can drive your Shoal platform straight from the AI assistant or editor you already use. Once connected, your assistant can browse the shared blueprint templates, create your own projects and environments, set environment variables, and inspect your deployment graph - all as you.

Any MCP-capable client works. This guide shows the eight most common ones. There's no API key to manage: the server uses **OAuth**, so you point your client at the server URL, sign in to your space in the browser window that opens, and you're connected.

## 1. Your MCP server details

You'll need these for every client below:

!!! info "Server details"
    | Field | Value |
    |---|---|
    | **URL** | `https://api.shoalstack.com/mcp/v1` |
    | **Transport** | Streamable HTTP |
    | **Auth** | OAuth - sign in to your space when prompted |

The first time a client connects, it opens your browser and asks you to log in to Shoal and approve access. Your client stores the resulting token and refreshes it on its own - you only do this once per client.

## 2. Add it to your assistant

Pick your client.

=== ":simple-anthropic: Claude"

    **Claude Code** (CLI) - add the server in one command:

    ```bash
    claude mcp add --transport http shoal-mcp-server https://api.shoalstack.com/mcp/v1
    ```

    Then run `/mcp` inside Claude Code and pick **shoal-mcp-server** to complete the login.

    **Claude Desktop** - open **Settings → Connectors → Add custom connector**, paste the URL above, and click **Connect** to sign in.

    More detail: [Claude MCP docs](https://docs.claude.com/en/docs/claude-code/mcp){ target="_blank" }.

=== ":simple-googlegemini: Gemini"

    **Gemini CLI** - add the server to `~/.gemini/settings.json`:

    ```json
    {
      "mcpServers": {
        "shoal-mcp-server": {
          "httpUrl": "https://api.shoalstack.com/mcp/v1"
        }
      }
    }
    ```

    Start the CLI and run `/mcp auth shoal-mcp-server` to sign in.

    More detail: [Gemini CLI MCP docs](https://google-gemini.github.io/gemini-cli/docs/tools/mcp-server.html){ target="_blank" }.

=== ":fontawesome-brands-openai: ChatGPT / Codex (OpenAI)"

    **ChatGPT** - open **Settings → Connectors → Add custom connector** (developer mode), paste `https://api.shoalstack.com/mcp/v1`, and sign in when prompted.

    **Codex** - Codex CLI, the Codex IDE extension, and the Codex panel in the ChatGPT desktop app all read the same local config, so setting it up once covers all three.

    **1. Install Codex and sign in**

    ```bash
    npm install -g @openai/codex
    codex login
    ```

    **2. Add the Shoal MCP server**

    ```bash
    codex mcp add shoal-mcp-server -- --url https://api.shoalstack.com/mcp/v1
    ```

    Or add it directly in `~/.codex/config.toml`:

    ```toml
    [mcp_servers.shoal-mcp-server]
    url = "https://api.shoalstack.com/mcp/v1"
    ```

    **3. Sign in**

    ```bash
    codex mcp login shoal-mcp-server
    ```

    More detail: [Codex MCP docs](https://developers.openai.com/codex/mcp){ target="_blank" }.

=== ":simple-x: Grok (xAI)"

    Grok can call remote MCP servers.

    - **Grok app** - open **Settings → Connectors → Add MCP server** (or **Add custom connector**), paste the URL `https://api.shoalstack.com/mcp/v1`, and sign in when prompted.
    - **Grok CLI / MCP-capable Grok client** - point it at the same URL using the client's `mcpServers` config (same shape as the Cursor tab).

    !!! info "xAI MCP support is newer"
        Grok's MCP connector support is relatively new and the exact menu wording changes as xAI iterates. If you don't see an MCP / custom-connector option, check [xAI's documentation](https://docs.x.ai){ target="_blank" } for the current steps.

=== ":simple-cursor: Cursor"

    Create `.cursor/mcp.json` in your project (or `~/.cursor/mcp.json` for all projects):

    ```json
    {
      "mcpServers": {
        "shoal-mcp-server": {
          "url": "https://api.shoalstack.com/mcp/v1"
        }
      }
    }
    ```

    Then enable the server under **Settings → MCP** and click **Login** / **Needs login** to authorise it. More detail: [Cursor MCP docs](https://docs.cursor.com/context/model-context-protocol){ target="_blank" }.

=== ":simple-windsurf: Windsurf"

    Open **Windsurf Settings → Cascade → MCP Servers → Manage → View raw config**, and add the server to `~/.codeium/windsurf/mcp_config.json`:

    ```json
    {
      "mcpServers": {
        "shoal-mcp-server": {
          "serverUrl": "https://api.shoalstack.com/mcp/v1"
        }
      }
    }
    ```

    Click **Refresh**, then hit the server's login prompt to sign in. More detail: [Windsurf MCP docs](https://docs.windsurf.com/windsurf/cascade/mcp){ target="_blank" }.

=== ":material-robot: Cline"

    In the Cline panel, open the **MCP Servers** icon → **Configure MCP Servers**, then add to `cline_mcp_settings.json`:

    ```json
    {
      "mcpServers": {
        "shoal-mcp-server": {
          "type": "streamableHttp",
          "url": "https://api.shoalstack.com/mcp/v1"
        }
      }
    }
    ```

    Cline opens the sign-in page on first connect. More detail: [Cline MCP docs](https://docs.cline.bot/mcp/configuring-mcp-servers){ target="_blank" }.

=== ":material-microsoft-visual-studio-code: VS Code"

    With GitHub Copilot, create `.vscode/mcp.json` in your workspace:

    ```json
    {
      "servers": {
        "shoal-mcp-server": {
          "type": "http",
          "url": "https://api.shoalstack.com/mcp/v1"
        }
      }
    }
    ```

    Click **Start** above the server entry - VS Code opens the browser for you to sign in and approve access. Because there's no secret in the file, it's safe to commit. More detail: [VS Code MCP docs](https://code.visualstudio.com/docs/copilot/chat/mcp-servers){ target="_blank" }.

## Verify it works

Ask your assistant to **list the available Shoal blueprints** - the shared, reusable templates on the platform. Behind the scenes that calls the read-only `list_blueprints` tool - if you get a list back, you're connected and ready to go. From there you can ask it to **create a project** of your own, add an environment, set variables, and more.

!!! tip "Not connecting?"
    - Make sure you completed the browser sign-in and approved access - some clients silently fail if the window was closed.
    - Confirm the URL is exactly `https://api.shoalstack.com/mcp/v1`.
    - Sign in with the account that has access to the space you want to work in.
    - Restart the client after editing its config file so it reloads the server.
    - Tokens expire eventually - if calls start failing, re-run your client's login step for the server.

New to Shoal? Start with the [Initial Setup guide](first-setup.md) to create your first space and project.
