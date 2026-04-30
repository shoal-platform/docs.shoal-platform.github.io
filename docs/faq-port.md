# What port should my app listen on?

Shoal's gateway maps your app to the outside world via port **`8080`** - so your app needs to listen on that port for traffic to reach it. If your framework defaults to something different, use the reference below to change it.

*Coming soon: Shoal will handle this mapping automatically so you won't need to configure it yourself.*

---

## Node.js

| Framework | Default Port | How to use port 8080 |
|---|---|---|
| Express | 3000 | `app.listen(8080)` |
| Fastify | 3000 | `fastify.listen({ port: 8080, host: '0.0.0.0' })` |
| NestJS | 3000 | `app.listen(8080)` |
| Koa | none | `app.listen(8080)` |
| Hapi | none | `port: 8080` in server config |

---

## Python

| Framework | Router / Server | Default Port | How to use port 8080 |
|---|---|---|---|
| Flask | Werkzeug | 5000 | `app.run(host='0.0.0.0', port=8080)` |
| Django | Gunicorn / runserver | 8000 | `CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]` |
| FastAPI | Uvicorn | 8000 | `CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]` |
| Tornado | Built-in | none | `app.listen(8080)` |

---

## Go

| Framework | Default Port | How to use port 8080 |
|---|---|---|
| Gin | 8080 | Already default - `r.Run(":8080")` |
| Echo | 1323 | `e.Start(":8080")` |
| Fiber | 3000 | `app.Listen(":8080")` |
| Chi | none | `http.ListenAndServe(":8080", r)` |
| net/http (stdlib) | none | `http.ListenAndServe(":8080", nil)` |

---

## Java

| Framework | Default Port | How to use port 8080 |
|---|---|---|
| Spring Boot | 8080 | Already default |
| Quarkus | 8080 | Already default |
| Micronaut | 8080 | Already default |
| Vert.x | 8888 | `vertx.createHttpServer().listen(8080)` |

---

## C\#

| Framework | Default Port | How to use port 8080 |
|---|---|---|
| ASP.NET Core | 5000 | Set env var `ASPNETCORE_URLS=http://+:8080` in container node config |
| Minimal API | 5000 | Set env var `ASPNETCORE_URLS=http://+:8080` in container node config |

---

## PHP

| Framework | Default Port | How to use port 8080 |
|---|---|---|
| Laravel | 8000 | `CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]` |
| Symfony | 8000 | `CMD ["php", "-S", "0.0.0.0:8080", "-t", "public"]` |
| Slim | none | `$app->run()` uses server config - set via `CMD ["php", "-S", "0.0.0.0:8080"]` |

---

## Ruby

| Framework | Default Port | How to use port 8080 |
|---|---|---|
| Rails (Puma) | 3000 | `CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8080"]` |
| Sinatra | 4567 | `set :port, 8080` and `set :bind, '0.0.0.0'` |

---

## Elixir

| Framework | Default Port | How to use port 8080 |
|---|---|---|
| Phoenix | 4000 | Set env var `PORT=8080` - Phoenix reads it by default |

---

## Kotlin

| Framework | Default Port | How to use port 8080 |
|---|---|---|
| Ktor | none | `embeddedServer(Netty, port = 8080, host = "0.0.0.0")` |
| Spring Boot (Kotlin) | 8080 | Already default |

---

## Rust

| Framework | Default Port | How to use port 8080 |
|---|---|---|
| Actix-web | none | `.bind("0.0.0.0:8080")?` |
| Axum | none | `TcpListener::bind("0.0.0.0:8080").await?` |
| Rocket | 8000 | Add `port = 8080` under `[default]` in `Rocket.toml` |
| Warp | none | `warp::serve(routes).run(([0, 0, 0, 0], 8080)).await` |
