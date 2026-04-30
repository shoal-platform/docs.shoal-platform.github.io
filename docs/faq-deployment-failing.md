# Why is my deployment failing?

**Check the Observability menu first** - it shows real-time build and runtime logs and is the quickest way to find the error.

| Symptom | Likely cause |
|---|---|
| Build fails immediately | Missing or invalid Dockerfile - see [Writing a Dockerfile](guide-dockerfile.md) |
| Build succeeds but app won't start | App crashing on startup - check runtime logs in Observability |
| App starts but isn't reachable | App not listening on port `8080` |
| Environment errors at runtime | Missing environment variable - check container node Config tab |

If you're still stuck, the Observability log output will usually point directly at the problem.
