<h1 align="center">From Notebook to macOS — HP 210 G1, Reinvented</h1>

**TL;DR:** A fully-configured vanilla OpenCore EFI for the **HP 210 G1** (Intel iGPU) — tested on **macOS Monterey (12.7.6)** and **macOS Sonoma (14.8)**. Includes ACPI patches, kexts, USB mapping, and post-install fixes.

---

## Table of Contents
- [Features (highlights)](#features-highlights)
- [Installation](#installation)
- [Post-install (already applied)](#post-install-already-applied)
- [Troubleshooting](#troubleshooting)
- [Benchmarks](#benchmarks)
- [Compatibility / What works](#compatibility--what-works)
- [Contributing](#contributing)
- [CHANGELOG](#changelog)
- [License](#license)

## Features (highlights)
- **Vanilla OpenCore EFI** for HP 210 G1 (Monterey & Sonoma)
- **ACPI patches, kexts, USB mapping, power management, iGPU acceleration**
- Tested features: WiFi, Bluetooth, Graphics, Audio, Sleep, Battery reporting

---

## Installation
- Download the latest release: [Releases](https://github.com/MedoX71T/HP210G1-Hackintosh/releases) — release zips include SHA256 checksums (see `RELEASE_CHECKSUMS.md`).
- Create a macOS USB installer (see Dortania's OpenCore Install Guide or `GETTING STARTED` below)
- Mount the EFI partition and copy the matching `EFI/` folder (choose Monterey or Sonoma)
- Boot the USB with OpenCore, choose `Install macOS`, and complete the installer

## Post-install (already applied)
- Post-install configuration has already been applied in this EFI (SMBIOS, serials, kexts, ACPI patches, and USB mapping).
- Need to re-apply or customize post-install steps? Mount the EFI and update `EFI/OC` files; follow the OpenCore Post-Install Guide for detailed steps.
- For changes affecting iCloud/FaceTime, ensure SMBIOS and serials are valid and use a whitelisted Apple ID.

## Troubleshooting
- Boot issues: enable verbose boot (`-v`) and check `config.plist` for OpenCore version or ACPI/kext mismatches.
- No audio: confirm `AppleALC.kext` layout ID and presence of `SSDT-HPET.aml`.
- No iCloud/FaceTime: verify SMBIOS, serials, and that the Apple ID is whitelisted.
- USB problems: re-run USB mapping and confirm kexts are injected correctly.

Tools & logs: Use `MountEFI`, `IORegistryExplorer`, and `Hackintool` for diagnosis. When opening an issue, include your EFI zip and logs (`/var/log/system.log`, `BootLog.txt`, and an IORegistry dump). Use `scripts/collect-diagnostics.sh` to produce a diagnostics archive to attach to issues.

<p align="center">
    <a href="https://www.apple.com/macos/monterey/">
        <img src="https://img.shields.io/badge/Monterey-12.7.6-orange"></a>
    <a href="https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/hp-210-g1-notebook-pc-data-sheet.pdf">
        <img src="https://img.shields.io/badge/Notebook-HP 210 G1-red"/></a>
    <a href="https://github.com/acidanthera/OpenCorePkg">
        <img src="https://img.shields.io/badge/OpenCore-1.0.5-yellow"/></a>
    <a href="#">
        <img src="https://img.shields.io/github/last-commit/MedoX71T/HP210G1-Hackintosh"/></a>
    <a href="https://github.com/MedoX71T/HP210G1-Hackintosh/releases">
        <img src="https://img.shields.io/github/v/release/medox71t/HP210G1-Hackintosh"/></a>
</p>

<p align="center">
    <a href="https://ko-fi.com/medox71t">
        <img src="https://img.shields.io/badge/Kofi-Buy%20me%20a%20coffee-orange.svg"></a>
    <a href="https://www.buymeacoffee.com/MedoX71T">
        <img src="https://img.shields.io/badge/Donate-MedoX71T%20-FFF27D"></a>
    
</p>

<p align="center">
    <a href="">
        <img src="src/HP-210-G1.png" alt="HP 210 G1 running macOS Monterey & Sonoma" width="800"> </a>
</p>

<p align="center"><em>Screenshot: HP 210 G1 running macOS Monterey & Sonoma</em></p>

#### I am not responsible for any damages you may cause.

#### If my work here helped you. Please consider donating, it would mean a lot to me.

- Complete EFI packs are available in the releases page.
- I will try my best to keep the repo updated with the latest kexts and OpenCore version.
- This EFI is configured with Monterey and Sonoma.
- With every EFI update you retrieve from here please remember to go through the post install guide.
- For macOS Monterey — see the [OLARILA GUIDE](https://www.olarila.com/topic/20908-easy-fast-and-perfect-vanilla-hackintosh/).

## Update

> **Optimizations:** CPU usage and GPU performance have been improved through power management and iGPU tuning.

### Recent

<details>
<summary><strong> SUMMARY </strong></summary>
<br>

> ### Non-Functional

| Feature | Status | Dependency                  |
| :------ | ------ | --------------------------- |
| None    | ❌     | Everything is working fine. |

<p align="center">
    <a href="">
        <img src="src/Hardware.png" alt="HP 210 G1 hardware overview" width="800"> </a>
</p>

> ### Video and Audio

| Feature                              | Status | Dependency                                             |
| :----------------------------------- | ------ | ------------------------------------------------------ |
| Full Graphics Acceleration           | ✅     | `WhateverGreen.kext`                                   |
| Audio Recording                      | ✅     | `AppleALC.kext` with Layout ID = 3 and `SSDT-HPET.aml` |
| Audio Playback                       | ✅     | `AppleALC.kext` with Layout ID = 3 and `SSDT-HPET.aml` |
| Automatic Headphone Output Switching | ✅     | `AppleALC.kext` with Layout ID = 3 and `SSDT-HPET.aml` |
| Dock Audio Port                      | ✅     | `AppleALC.kext` with Layout ID = 3 and `SSDT-HPET.aml` |

<p align="center">
    <a href="">
        <img src="src/Video.png" alt="HP 210 G1 graphics & audio details" width="800"> </a> 
</p>

> ### Power, Charge, Sleep and Hibernation

| Feature                       | Status | Dependency                           |
| :---------------------------- | ------ | ------------------------------------ |
| Battery Percentage Indication | ✅     | `ECEnabler.kext`                     |
| iGPU Power Management         | ✅     | `WhateverGreen`                      |
| Sleep/ Hibernation Mode       | ✅     | `SMBIOS`                             |
| Custom Charge Threshold       | ✅     | `SSDT-EC.aml`                        |
| Battery Life                  | ✅     | Native, comparable to Windows/Linux. |

<p align="center">
    <a href="">
        <img src="src/Battery.png" alt="HP 210 G1 battery and power features" width="800"> </a> 
</p>

> ### Input/ Output

| Feature                       | Status | Dependency                                          |
| :---------------------------- | ------ | --------------------------------------------------- |
| WiFi                          | ✅     | `AirportItlwm.kext`,`AirportBrcmFixup.kext`         |
| Bluetooth                     | ✅     | `IntelBluetoothFirmware.kext`,`IntelBTPatcher.kext` |
| Ethernet                      | ✅     | `IntelMausi.kext`                                   |
| USB 2.0, USB 3.0              | ✅     | `USBPorts.kext`                                     |
| USB Power Properties in macOS | ✅     | `SSDT-PLUG.aml`                                     |

<p align="center">
    <a href="">
        <img src="src/Input.png" alt="HP 210 G1 I/O and networking features" width="800"> </a> 
</p>

> ### Display, TrackPad, TrackPoint, and Keyboard

| Feature                | Status | Dependency                                                      |
| :--------------------- | ------ | --------------------------------------------------------------- |
| Brightness Adjustments | ✅     | `WhateverGreen.kext`, `SSDT-PNLF.aml` and `BrightnessKeys.kext` |
| TrackPoint             | ✅     | `VoodooPS2Controller.kext`                                      |
| TrackPad               | ✅     | `VoodooPS2Controller.kext`                                      |
| Built-in Keyboard      | ✅     | `VoodooPS2Controller.kext`                                      |
| Multimedia Keys        | ✅     | `BrightnessKeys.kext`                                           |

<p align="center">
    <a href="">
        <img src="src/Trackpad.png" alt="HP 210 G1 trackpad & keyboard" width="800"> </a> 
</p>

> ### macOS Continuity

| Feature                    | Status | Dependency                         |
| :------------------------- | ------ | ---------------------------------- |
| iCloud, iMessage, FaceTime | ✅     | Whitelisted Apple ID, Valid SMBIOS |
| AirDrop                    | ✅     | Not tested                         |
| Time Machine               | ✅     | Native                             |

<p align="center">
    <a href="">
        <img src="src/Icloud.png" alt="macOS continuity & iCloud features on HP 210 G1" width="800"> </a> 
</p>

</details>

<details>
<summary><strong> REFERENCES </strong></summary>
<br>

Read these before you start:

- [dortania's Hackintosh guides](https://github.com/dortania).
- [dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/).
- [dortania's OpenCore Post Install Guide](https://dortania.github.io/OpenCore-Post-Install/).
- [dortania/ Getting Started with ACPI](https://dortania.github.io/Getting-Started-With-ACPI/).
- [dortania/ opencore `multiboot`](https://github.com/dortania/OpenCore-Multiboot).
- [dortania/ `USB map` guide](https://dortania.github.io/OpenCore-Post-Install/usb/).
- [WhateverGreen Intel HD Manual](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md).
- `Configuration.pdf` and `Differences.pdf` in each `OpenCore` releases.

</details>

<details>
<summary><strong> REQUIREMENTS </strong></summary>
<br>

- A macOS machine(optional): to create the macOS installer.
- Flash drive, 12GB or more, for the above purpose.
- Xcode works fine for editing plist files on macOS, but I prefer [PlistEdit Pro](https://www.fatcatsoftware.com/plisteditpro/).
- [ProperTree](https://github.com/corpnewt/ProperTree) if you need to edit plist files on Windows.
- [MaciASL](https://github.com/acidanthera/MaciASL), for patching ACPI tables and editing ACPI patches.
- [MountEFI](https://github.com/corpnewt/MountEFI) to quickly mount EFI partitions.
- [IORegistryExplorer](https://developer.apple.com/downloads), for diagnosis.
- [Hackintool](https://www.insanelymac.com/forum/topic/335018-hackintool-v286/), for diagnostic ONLY, Hackintool should not be used for patching, it is outdated.
- Patience and time, especially if this is your first time Hackintosh-ing.

</details>

<details>
<summary><strong> HARDWARE </strong></summary>
<br>

| Category  | HP 210 G1              |
| --------- | ---------------------- |
| CPU       | Intel Core i3-4010U    |
| SSD       | Samsung 128GB          |
| Display   | 11.6' HD (1366x768)    |
| WiFi & BT | Intel Wireless-AC 7260 |

</details>

<details>
<summary><strong> GETTING STARTED </strong></summary>
<br>

Before you do anything, please familiarize yourself with basic Hackintosh terminologies and the basic Hackintosh process by throughly reading Dortania guides as linked in `REFERENCES`

- Creating a macOS installer: refer to [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/)
- [**README-HARDWARE**](https://dortania.github.io/OpenCore-Install-Guide/macos-limits.html): Requirements before installing.
- [**README-POST-INSTALLATION**](https://dortania.github.io/OpenCore-Post-Install/#how-to-follow-this-guide): for post installation settings and other remarks.

</details>

## Benchmarks

<details>
<summary><strong> BENCHMARKS </strong></summary>
</br>

- macOS 12.7.5, EFI OpenCore 0.9.1

| CPU         | Single-Core | Multi-Core |
| :---------- | ----------: | ---------: |
| Geekbench 6 |         551 |       1079 |

| GPU         | OpenCL | Metal |
| :---------- | -----: | ----: |
| Geekbench 6 |   2280 |   944 |

- macOS 12.7.6, EFI OpenCore 1.0.5

| CPU         | Single-Core | Multi-Core |
| :---------- | ----------: | ---------: |
| Geekbench 6 |         538 |        971 |

| GPU         | OpenCL | Metal |
| :---------- | -----: | ----: |
| Geekbench 6 |   2464 |  1023 |

</details>

## Compatibility / What works

| Feature | Status | Notes |
| :------ | :----- | :---- |
| WiFi | ✅ | Intel Wireless-AC 7260 via `AirportItlwm.kext` |
| Bluetooth | ✅ | Intel firmware + patching applied |
| Graphics (iGPU) | ✅ | Hardware acceleration via `WhateverGreen` |
| Audio | ✅ | `AppleALC` with layout id 3 and `SSDT-HPET.aml` |
| Sleep & Battery | ✅ | Power management and EC implemented |

---

## Updating OpenCore & Kexts 🔁

- Always **back up your EFI** before making changes (zip the `EFI` folder and store a copy off-device).
- Update kexts by replacing `.kext` folders inside `EFI/OC/Kexts` and update `config.plist` entries as needed.
- For OpenCore, follow the official OpenCore upgrade guide: make small incremental changes and test via a USB installer before adopting to your main EFI.
- Use the release workflow to generate checksums; verify downloaded release zips with `RELEASE_CHECKSUMS.md` instructions.

---

## Contributing
Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for issue & PR guidelines, how to run diagnostics, and testing notes.

## CHANGELOG
See [CHANGELOG.md](CHANGELOG.md) for notable releases and the unreleased section.

## License
This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.

# CONTACT

- Email: medox71t@gmail.com

# Credits

- [Apple](https://www.apple.com) for macOS.
- [Dortania](https://github.com/dortania) for for the OpenCore Install Guide.
- [Arabic Hackintosh Team](https://github.com/ARhackintosh/ARtutorial) for the Install Guide
