# How to Zip Your Project Folder

Shoal accepts a zip file of your project when you don't want to connect a GitHub repo directly.

!!! warning "Structure matters"
    Your zip must contain your files directly at the root - **not** wrapped in a subfolder. Shoal expects to find your `Dockerfile` and source files immediately when it opens the zip.

    **Correct structure:**
    ```
    myapp.zip
    ├── Dockerfile
    ├── main.py
    └── src/
    ```

    **Wrong structure:**
    ```
    myapp.zip
    └── myapp/          ← extra folder will break the build
        ├── Dockerfile
        ├── main.py
        └── src/
    ```

---

=== "Mac"

    **Using Finder:**

    The standard **Compress** right-click on a folder wraps everything in a subfolder — which won't work. Instead, compress the contents:

    1. Open your project folder in Finder.
    2. Press **Cmd+A** to select all files and folders inside.
    3. Right-click the selection and choose **Compress X Items**.

    The resulting `Archive.zip` will contain your files at the root.

    **Using Terminal (recommended):**

    Navigate into your project folder first, then zip from inside it:

    ```bash
    cd myapp
    zip -r ../myapp.zip .
    ```

    This puts all files and subdirectories at the root of the zip, with no wrapping folder.

=== "Linux"

    **Using the terminal:**

    Navigate into your project folder first, then zip from inside it:

    ```bash
    cd myapp
    zip -r ../myapp.zip .
    ```

    This puts all files and subdirectories at the root of the zip, with no wrapping folder.

    > Running `zip -r myapp.zip myapp/` from outside the folder will wrap everything in a `myapp/` subdirectory - avoid this.

    If `zip` is not installed:

    ```bash
    # Debian / Ubuntu
    sudo apt install zip

    # Fedora / RHEL
    sudo dnf install zip
    ```

=== "Windows"

    **Using PowerShell (recommended):**

    Use `.\myapp\*` (with the `*`) to zip the contents rather than the folder itself:

    ```powershell
    Compress-Archive -Path .\myapp\* -DestinationPath .\myapp.zip
    ```

    > Using `-Path .\myapp` without the `*` will wrap everything in a `myapp\` subfolder inside the zip - avoid this.

    **Using File Explorer:**

    Right-clicking a folder and choosing **Send to → Compressed (zipped) folder** wraps it in a subfolder — which won't work. Instead, compress the contents:

    1. Open your project folder in File Explorer.
    2. Press **Ctrl+A** to select all files and folders inside.
    3. Right-click the selection and choose **Send to → Compressed (zipped) folder**.
