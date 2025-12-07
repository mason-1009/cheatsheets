# Rclone

> Rclone is a command-line program to manage files on cloud storage. It is a
> feature-rich alternative to cloud vendors' web storage interfaces. Over 70
> cloud storage products support rclone including S3 object stores, business &
> consumer file storage services, as well as standard transfer protocols.

---

## Getting Started

Run the following command to begin an interactive session for setting up your
preferred `rclone` backend:

```bash
rclone config
```

**Note:** Keeping remote names shorter will make it easier to use them in
subsequent commands. For example, name your backend `proton` instead of `Proton
Drive`.

## Basic Operations

### List

```bash
rclone ls target:top_folder/bottom_folder
```

Size and modification times can be listed with `lsl`:

```bash
rclone lsl target:top_folder/bottom_folder
```

List only directories:

```bash
rclone lsd target:top_folder/bottom_folder
```

List the directory tree:

```bash
rclone tree target:top_folder/bottom_folder

# Only include directories
rclone tree --dirs-only target:top_folder/bottom_folder
```

### Copy

```bash
rsync copy /path/to/file.ext target:folder_name/file.ext
```

### Move

```bash
rsync move target:old_folder/file.ext target:new_folder/file.ext
```

### Delete

Deleting a single file is simple:

```bash
rclone delete target:folder/file.ext
```

Deleting a folder recursively is done with the `purge` command:

```bash
rclone purge target:folder
```

## Unidirectional Synchronization

Similar to `rsync`, `rclone` supports a unidirectional sync, copying, updating,
or deleting files on the target such that it matches the source:

```bash
rclone sync --progress /home/user/Documents target:Documents
```

To prevent unintended data loss, pass the `--dry-run` flag before running the
actual sync:

```bash
rclone sync --dry-run /home/user/Documents target:Documents
```
