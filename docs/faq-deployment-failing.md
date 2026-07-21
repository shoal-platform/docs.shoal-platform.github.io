# Why is my deployment failing?

**Check Observability & Logs first** - it shows real-time build and runtime logs and is the quickest way to find the error. You can also follow progress on the **Deployments** page.

| Symptom | Likely cause |
|---|---|
| Build fails immediately | Missing or invalid Dockerfile - see [Writing a Dockerfile](guide-dockerfile.md) |
| Build succeeds but app won't start | App crashing on startup - check runtime logs in Observability & Logs |
| App starts but isn't reachable | App not listening on the configured port (default `8080`, or the port from the Framework dropdown) |
| Environment errors at runtime | Missing environment variable - check the container node's **Env** section |

If you're still stuck, the Observability & Logs output will usually point directly at the problem.
