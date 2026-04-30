# What port should my app listen on?

Shoal expects your app to listen on port **`8080`**. Make sure your app binds to this port, and that your Dockerfile includes `EXPOSE 8080`.

If your framework defaults to a different port, you can usually override it with an environment variable. For example:

=== "Python (Flask)"

    ```python
    app.run(host="0.0.0.0", port=8080)
    ```

=== "Node.js"

    ```javascript
    const PORT = process.env.PORT || 8080;
    app.listen(PORT);
    ```

=== "Go"

    ```go
    http.ListenAndServe(":8080", nil)
    ```
