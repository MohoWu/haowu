---
title: My First Hakintosh Project
author: Hao Wu
date: '2018-12-17'
slug: my-first-hakintosh-project
categories:
  - hackintosh
tags:
  - hackintosh
  - intel nuc
description: ''
featured_image: "/image/tonymacx86-logo.png"
---

Make a Hackintosh with NUC8ixBxx.

# Prerequisite

* An USB stick (at least 8 GB)
* MacOS (doesn't need to be a Mac, you can [set up a Mac virtual machine on Windows](https://techsviewer.com/install-macos-mojave-vmware-windows/))
* Intel NUC with RAM and storage installed

# Download macOS Mojave

* Download Mojave from App store.
* Make a bootable USB from Terminal

  - get a list of disk info
  ```
  diskutil list
  ```
  
  - Erase USB
  ```
  # repartition /dev/disk1 GPT, one partition
  # EFI will be created automatically
  # second partition, "install_osx", HFS+J, remainder
  diskutil partitionDisk /dev/disk1 1 GPT HFS+J "install_osx" R
  ```
  
  - Build the OS X installer
  ```
  # copy installer image
  sudo "/Applications/Install macOS Mojave.app/Contents/Resources/createinstallmedia" --volume  /Volumes/install_osx --nointeraction
  ```
  
# Initial installation

## Make a bootable USB drive

Use Clover for this install. Try unibeast next time?

### Clover options

* Require Clover v4658 later
* add EmuVariableUefi-64.efi to drivers64UEFI

### kexts

* [Kexts download link](https://hackintosher.com/downloads/kexts/)
* definitely need the fakeSMC.kext
* copy IntelMausiEhernet.kext to clover/kexts/Other
* prob no need Lilu and IntelGraphicsFixup

### config.plist

* copy config_install_nuc8_bc.plist to EFI/Clover/config.plist: https://github.com/RehabMan/Intel-NUC-DSDT-Patch

# BIOS settings

1. After the main screen comes up choose "Advanced". 
1. To start, choose "Load Defaults" (choose from the menu or press F9 in the BIOS setup).

Then change:

- Boot->Boot Configuration, disable "Network Boot"
- Power->Secondary Power Settings, "Wake on LAN from S4/S5", set to "Stay Off"

These settings are important but are already set as needed by "Load Defaults"

- Devices->Video, "IGD Minimum Memory" set to 64mb or 128mb
- Devices->Video, "IGD Aperture Size" set to 256mb
- Boot->Secure Boot, "Secure Boot" is disabled
- Security->Security Features, "Execute Disable Bit" is enabled.
- Boot->Boot Priority->Legacy Boot Priority, enable "Legacy Boot"

# Install macOS Mojave 

Be patient. There might be several reboots.

# Post installation

* Install Clover to internal drive (follow step 9 [here](https://9to5mac.com/2017/04/28/building-a-gtx-1080-ti-powered-hackintosh-installing-macos-sierra-step-by-step-video/))
* Finish up the post installation by following the __Post Installation__ section of this [guide](https://www.tonymacx86.com/threads/guide-intel-nuc7-nuc8-using-clover-uefi-nuc7i7bxx-nuc8i7bxx-etc.261711/)

