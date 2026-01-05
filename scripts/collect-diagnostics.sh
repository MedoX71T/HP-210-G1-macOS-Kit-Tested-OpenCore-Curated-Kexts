#!/usr/bin/env bash
# collect-diagnostics.sh — gather EFI, logs and IORegistry hints for bug reports
set -euo pipefail
OUT="hp210g1-diagnostics-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$OUT"
# EFI
if mount | grep -q "EFI"; then
  echo "Copying mounted EFI directories..."
  cp -r /Volumes/EFI/* "$OUT/EFI" 2>/dev/null || true
else
  echo "Mount EFI before running this script (sudo diskutil mount "/Volumes/EFI" example)"
fi
# Boot log (if present)
if [ -f /var/log/BootLog.txt ]; then
  cp /var/log/BootLog.txt "$OUT/"
fi
# System log excerpt
sudo log show --style syslog --predicate 'process == "kernel" or process == "kernel_task"' --last 1h > "$OUT/system_recent.log" || true
# IORegistry: recommend using IORegistryExplorer (not scriptable); include optional guidance
echo "Please attach an IORegistry dump from IORegistryExplorer and /var/log/system.log excerpts if possible." > "$OUT/README.txt"
# Archive
tar czf "$OUT.tar.gz" "$OUT"
echo "Diagnostics package created: $OUT.tar.gz"
echo "Attach $OUT.tar.gz to the issue and include your macOS version and EFI zip."