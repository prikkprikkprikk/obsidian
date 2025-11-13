---
tags:
  - terminal
  - command-line
---
Søk i .zip-filer (f.eks. zippa loggfiler) med zgrep!

```bash
zgrep "search_pattern" *.gz
```

You can use `zgrep`, which is specifically designed for searching through compressed files.

For a single compressed file:

```bash
zgrep "search_pattern" file.log.gz
```

For all gzipped files in a directory:

```bash
zgrep "search_pattern" /path/to/logs/*.gz
```

Or if you're in the directory:

```bash
zgrep "search_pattern" *.gz
```

`zgrep` supports most of the same options as regular `grep`, so you can use things like:

- `-i` for case-insensitive search
- `-r` for recursive search through subdirectories
- `-n` to show line numbers
- `-c` to count matches

Example:

```bash
zgrep -i "error" /var/log/*.gz
```

If you need to search through other compression formats:

- `bzgrep` for `.bz2` files
- `xzgrep` for `.xz` files
- `zstdgrep` for `.zst` files