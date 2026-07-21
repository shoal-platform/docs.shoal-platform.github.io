# Deploying an Application with a Database

In this example, we have an application connected to an external database by pasting a connection string into environment variables.

For managed Neon or MongoDB on the canvas, prefer the dedicated guides: [Deploy with Neon](deploy-app-neon.md) or [Deploy with MongoDB](deploy-app-mongodb.md).

You need two components: a **container node** and a **gateway node**.

- **Container node** - links to your source code, runs and scales your container, and lets you add environment variables (like your database connection string).
- **Gateway node** - where you set the DNS name for your app.

Hit deploy, and it just works.

### Step One

Drag a container node and a gateway node onto the canvas, then link them together. You can also add a comment box if you like.

![Create App](assets/screenshots/app1.png)

### Step Two

Click the gateway node to open it, expand the **Domain** section, and enter the URL name you want. For example, entering `shopping-test` will make your app available at `shopping-test.eu1.shoal.live`.

![Create App](assets/screenshots/app2.png)

### Step Three

Click the container node to open it, expand the **Source** section, and set up your source - a GitHub repo, a container image, or a file upload. If your project includes a Dockerfile, Shoal builds from it; otherwise, for supported runtimes, Shoal auto-detects your stack and builds it for you.

You can add the environment variables via the container node's **Env** section, or via the **Settings** page on the environment.

Add any environment variables your app needs here. For example:

```
DATABASE_CONNECTION = postgresql://neondb_owner:password@server.aws.neon.tech/neondb?sslmode=require
```

![Create App](assets/screenshots/app5.png)
![Create App](assets/screenshots/app6.png)

Environment variables are passed in at runtime only - they're stored securely and encrypted. You can also review, add, or remove them any time from the environment **Settings** page.

### Step Four

Press **Deploy**. You can watch the deployment in real time via the **Deployments** page, or check build and runtime logs under **Observability & Logs**.

### Done

Your app is live at the address you configured - connected to your database and running in a scalable, resilient, and protected environment.
