# Writing a Dockerfile

Shoal uses Docker to package and run your app in a container. A Dockerfile is a plain text file that describes how to do that - it tells Shoal what language runtime to use, how to install your dependencies, and how to start your app.

**Without a Dockerfile, Shoal can't build your container.** *(Support for automatic detection without a Dockerfile is coming soon.)*

## Where does it go?

The Dockerfile must be in the **root of your project** - the same top-level folder you're uploading or pointing your GitHub repo at.

```
my-project/
├── Dockerfile        ← here
├── main.py           (or index.js, main.go, etc.)
├── requirements.txt  (or package.json, go.mod, etc.)
└── ...
```

Shoal looks for it there automatically when you deploy. You don't need to configure the path.

## Examples

Here are simple starting-point Dockerfiles for common languages.

=== "Python"

    ```dockerfile
    FROM python:3.12-slim

    WORKDIR /app

    COPY requirements.txt .
    RUN pip install --no-cache-dir -r requirements.txt

    COPY . .

    EXPOSE 8080

    CMD ["python", "main.py"]
    ```

    > Make sure your app listens on port `8080`, or update `EXPOSE` and your start command to match.

=== "Node.js"

    ```dockerfile
    FROM node:20-slim

    WORKDIR /app

    COPY package*.json ./
    RUN npm ci --omit=dev

    COPY . .

    EXPOSE 8080

    CMD ["node", "index.js"]
    ```

    > Replace `index.js` with your app's entry point if it differs.

=== "Go"

    ```dockerfile
    FROM golang:1.22-alpine AS builder

    WORKDIR /app
    COPY . .
    RUN go build -o server .

    FROM alpine:latest

    WORKDIR /app
    COPY --from=builder /app/server .

    EXPOSE 8080

    CMD ["./server"]
    ```

    > This uses a two-stage build - the final image contains only your compiled binary, keeping it small.
