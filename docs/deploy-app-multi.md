# Deploying an Application with Multiple Containers and Routing

In this example, we have an application made up of several services, all exposed under one domain.

You need four components: three **container nodes** and one **proxy node**.

- **Container nodes** — each links to its own source code and runs independently, with automatic scaling and resilience.
- **Proxy node** — routes incoming requests to the right container based on the path or subdomain you configure.

Hit deploy, and it just works.

### Step One

Drag a container node and a proxy node onto the canvas, then link them together. You can also add a comment box if you like.

![Create App](assets/screenshots/app1.png)

### Step Two

Click the proxy node, open the **Config** tab, and enter the URL name you want. For example, entering `shopping-test` will make your app available at `shopping-test.eu1.shoal.live`. You can also point a custom domain at this address.

### Step Three

Click each container node, open the **Config** tab, and set up its source — either a GitHub repo or a file upload. You'll need a Dockerfile in each service's code.

### Step Four

Configure routing on the proxy node. Double-click a connection to enter the path prefix you want to route to each service. For example, if you have a finance service and a payment service:

- `/finance/` → finance container
- `/payments/` → payments container

A standard pattern for services and microservices is to include a version in the path — e.g. `/finance/v1/...` and `/payments/v1/...`. This keeps routing clean and gives your frontend a stable contract as services evolve.

### Step Five

Press **Deploy**. You can watch the deployment in real time via the **Observability** menu, or by clicking the link on the deploy button.

### Done

Your app is live at the address you configured — with traffic routed to the right service, running in a scalable, resilient, and protected environment.
