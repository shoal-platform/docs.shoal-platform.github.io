# How to Zip Your Project Folder

Shoal accepts a zip file of your project when you don't want to connect a GitHub repo directly. Here's how to create one on each platform.

=== "Mac"

    **Using Finder:**

    1. Locate your project folder in Finder.
    2. Right-click the folder.
    3. Select **Compress "folder-name"**.

    A `.zip` file will appear in the same location.

    **Using Terminal:**

    ```bash
    zip -r myapp.zip myapp/
    ```

    Replace `myapp` with your folder name.

=== "Linux"

    **Using the terminal:**

    ```bash
    zip -r myapp.zip myapp/
    ```

    Replace `myapp` with your folder name. If `zip` is not installed:

    ```bash
    # Debian / Ubuntu
    sudo apt install zip

    # Fedora / RHEL
    sudo dnf install zip
    ```

=== "Windows"

    **Using File Explorer:**

    1. Locate your project folder.
    2. Right-click the folder.
    3. Select **Send to → Compressed (zipped) folder**.

    **Using PowerShell:**

    ```powershell
    Compress-Archive -Path .\myapp -DestinationPath .\myapp.zip
    ```

    Replace `myapp` with your folder name.
