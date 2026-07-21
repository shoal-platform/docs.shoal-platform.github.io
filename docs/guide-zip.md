# Uploading Your Project

When connecting a container node to a file source, you have two options:

| Option | How | Best for |
|---|---|---|
| **Folder upload** | Select a folder directly - no zipping needed | Most cases |
| **Zip upload** | Create a zip and upload the file | Large projects, scripted uploads |

## Option 1 - Upload a folder directly

Select the folder option in the container node config and pick your project folder. Shoal handles everything automatically - no zipping required.

Shoal also automatically removes files that don't belong in a deployed container (dependencies, caches, build artefacts, editor config, and `.env` files), so only your source code is sent. Uploads must be **5 MB or less** after those exclusions. See the full [skipped files reference](skipped-files.md) for details.

---

## Option 2 - Upload a zip file

Shoal accepts a zip file of your project when you prefer to create the archive yourself.

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
