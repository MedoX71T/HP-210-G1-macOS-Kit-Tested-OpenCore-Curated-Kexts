# Release checksums

To help users verify downloads, release zips include SHA256 checksums.

How to generate a checksum locally:

```bash
sh scripts/gen-sha256.sh path/to/release.zip
```

How to verify a checksum:

```bash
sh scripts/gen-sha256.sh path/to/release.zip > checksum.txt
sha256sum -c checksum.txt  # on Linux
shasum -a 256 -c checksum.txt  # on macOS
```

Include the generated checksum in the release description or a `SHA256SUMS.txt` file.