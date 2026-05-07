# What Shoal Supports

Shoal is designed to run any containerised application. If it runs in Docker, it runs on Shoal.

---

## Application Types

=== ":material-web: Web Applications"

    | Type | Examples |
    |---|---|
    | Server-rendered web apps | Next.js, Nuxt, SvelteKit, Remix, Rails, Django, Laravel |
    | Single-page app backends | Any API serving a React, Vue, Angular, or Svelte frontend |
    | Static site generators (with SSR) | Next.js, Astro, Nuxt |
    | CMS-backed apps | Headless CMS backends, custom admin panels |
    | Internal tools & dashboards | Any web UI served over HTTP |

=== ":material-api: APIs & Backend Services"

    | Type | Examples |
    |---|---|
    | REST APIs | Express, FastAPI, Gin, Spring Boot, ASP.NET Core |
    | GraphQL APIs | Apollo Server, Strawberry, gqlgen, Hot Chocolate |
    | gRPC services | Any language with gRPC support |
    | WebSocket servers | Socket.io, ws, Gorilla WebSocket |
    | Background workers | Queue consumers, event processors, data pipelines |

=== ":material-cog-refresh: Scheduled Jobs"

    | Type | Examples |
    |---|---|
    | Recurring tasks | Nightly reports, data sync, cache warming |
    | Notifications | Slack updates, email digests, alerts |
    | Data processing | ETL jobs, aggregations, cleanup tasks |
    | Monitoring scripts | Health checks, uptime pings |

    Scheduled jobs use standard crontab expressions - see the [crontab guide](faq-crontab.md) for details.

=== ":material-lan: Microservices"

    | Pattern | Description |
    |---|---|
    | Path-based routing | Route `/api/`, `/payments/`, `/inventory/` to separate containers |
    | Multi-service under one domain | Run multiple independent services behind a single gateway |
    | Independent scaling | Each container scales on its own based on load |
    | Versioned APIs | `/v1/`, `/v2/` routing for frontend compatibility |

---

## Languages

Shoal supports any language that can be packaged in a Docker container. These are the most commonly used:

| Language | |
|---|---|
| :simple-nodedotjs: Node.js | :simple-python: Python |
| :simple-go: Go | :fontawesome-brands-java: Java |
| :simple-dotnet: C# / .NET | :simple-php: PHP |
| :simple-ruby: Ruby | :simple-elixir: Elixir |
| :simple-kotlin: Kotlin | :simple-rust: Rust |

> Any other language that runs in a container is supported too. See the [Dockerfile guide](guide-dockerfile.md) for how to package your app.

---

## Frameworks

Shoal works with any framework. Common ones across each language:

=== ":simple-nodedotjs: Node.js"

    Express, Fastify, NestJS, Koa, Hapi, Next.js, Remix, Nuxt

=== ":simple-python: Python"

    Flask, Django, FastAPI, Tornado, Starlette, Litestar

=== ":simple-go: Go"

    Gin, Echo, Fiber, Chi, net/http

=== ":fontawesome-brands-java: Java"

    Spring Boot, Quarkus, Micronaut, Vert.x

=== ":simple-dotnet: C#"

    ASP.NET Core, Minimal API, Blazor Server

=== ":simple-php: PHP"

    Laravel, Symfony, Slim

=== ":simple-ruby: Ruby"

    Rails, Sinatra

=== ":simple-elixir: Elixir"

    Phoenix

=== ":simple-kotlin: Kotlin"

    Ktor, Spring Boot

=== ":simple-rust: Rust"

    Actix-web, Axum, Rocket, Warp

For default ports per framework, see the [framework port reference](faq-port.md).

---

## Deployment Patterns

| Pattern | Components | Guide |
|---|---|---|
| Web app | Container + Gateway | [Deploy an application](deploy-app.md) |
| App with database | Container + Gateway + external DB | [Deploy with a database](deploy-app-database.md) |
| Scheduled job | Container + Scheduler | [Deploy with a scheduler](deploy-app-scheduler.md) |
| Microservices | Multiple containers + Gateway | [Deploy with multiple containers](deploy-app-multi.md) |

---

## Included with Every Deployment

!!! success "What the Shoal gateway gives you out of the box"

    | Feature | Details |
    |---|---|
    | **SSL / HTTPS** | Automatic certificate provisioning and renewal - A grade on SSL Labs |
    | **IPS** | Intrusion Prevention System blocks known attacks before they reach your app |
    | **Rate limiting** | Protects against traffic spikes and abuse |
    | **Custom domains** | Point your own domain at any deployment |
    | **Instant subdomain** | Every app gets a `*.eu1.shoal.live` address immediately |
    | **Automatic scaling** | Containers scale up under load and back down when quiet |
    | **Resilience** | Containers restart automatically on failure |

---

## Infrastructure

| | Now | Coming soon |
|---|---|---|
| **Cloud** | Google Cloud Platform (GCP) | AWS, Azure, and others |
| **Hosting** | Shoal-managed | Deploy to your own private infrastructure |
| **Databases** | External (e.g. Neon) | Shoal-managed databases |
| **Dockerfile** | Required | Auto-detection without a Dockerfile |
