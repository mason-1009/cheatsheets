# `rsync`

> Rsync is a fast and extraordinarily versatile file copying tool.

---

## Basic Usage

```bash
# Sync two directories (in "archive" mode)
rsync -aP /home/user/folder /mnt/drive/folder

# Equivalent statements include "/" after both the source and destination
rsync -aP /home/user/folder/ /mnt/drive/folder/
```

Adding a `/` after the directory path refers to the elements within the
directory, instead of the directory itself:

```bash
rsync -r
```

### Notes

- `-a` or `--archive` is equivalent to `-rlptgoD`
- `-r` or `--recursive` means copy recursively
- `-l` or `--links` copies symlinks as links
- `-p` or `--perms` preserves permissions
- `-t` or `--times` preserves timestamps
- `-g` or `--group` preserves groups
- `-o` or `--owner` preserves owners

## Delete Missing Files on the Target

Copy all files and folders from the `src` to `target` folder, deleting anything
in `target` not in `src`:

```bash
rsync --delete -rtP src target
```

Delete files *before* the transfer:

```bash
rsync --delete-before -rtP src target
```

Delete files *after* the transfer:

```bash
rsync --delete-after -rtP src target
```

## Show Progress

Show the progress of an active transfer (using `-p` or `--progress`):

```bash
rsync --progress -rt src target
rsync -rtP src target
```

## Exclude Filenames

Exclude files matching a pattern (such as all `.jpg` files):

```bash
rsync --exclude '*.jpg' -rtP src target
```

## Dry Run

For safety reasons, one can perform a "dry run," in which the outcome of a
command is simulated, but no real filesystem changes are made:

```bash
rsync --dry-run -rtP src target
```

## Show Detailed Change Logs

Prints a detailed change log after running a command:

```bash
rsync --itemize-changes -rtP src target
```

Produces output similar to this:

```text
>f+++++++++ newfile.txt
>f..t...... existingfile.txt
>f.s....og. modifiedfile.txt
.d..t...... directory/
```

## Exclude Files Based on Size

Synchronize two folders but exclude files *larger* than `3G`:

```bash
rsync --max-size=3G -rtP src target
```

Synchronize two folders but exclude files *smaller* than `1.5K`:

```bash
rsync --min-size=1.5K -rtP src target
```

## Common Issues

### Synchronizing `fat` Filesystems

A common problem involves synchronizing directories between `fat` filesystems
(such as `fat32`, which is popular for USB flash drives).

`fat32` filesystems operate on two-second timestamps, confusing the timestamp
and size comparison logic used by `rsync` to determine if a file should be
updated.

When synchronizing directories to or from `fat` filesystems, use the
`--modify-window` flag to allow for time differences up to a second:

```bash
rsync --modify-window=1 -rtP my_folder /mnt/usb/my_folder
```
