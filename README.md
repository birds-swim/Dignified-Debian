# Dignified-Debian

My personal setup of Spiral Linux Builder Edition (SLBE). A focus on Flatpak+DistroBox for the freshest software and a focus on light security enhancements.
https://spirallinux.github.io

This guide was created to remind myself how I created this system to my personal satisfaction in case I ever need to re-install Spiral Linux in the future.

Perhaps new Linux users might find this guide helpful?

# Why Debian?

Debian is a truly glorious system with a rightly-earned and well-established reputation for being bedrock stable, reliable, and dependable. Debian supports a ton of hardware. It has a huge software repository (59,000 packages in the Stable repos). Through the powers of Flatpak and DistroBox, point-release distros like Debian now have access to the freshest software available. You can extend this software availability even further with projects like Pacstall, Homebrew, or Nix (you have a wizard's beard that is long and gray). For my needs, I have found everything I've ever wanted from Debian Repos + Flatpak + Progressive Web Apps (via Chrome/Chromium based web browsers). Custom kernels like Liquorix were designed specifically for Debian to improve not only gaming on Debian but many other resource-intensive workloads.

# Why Spiral Linux?

(1) My favorite distro.

(2) To desktop Debian users (new and old): Have you ever found yourself tired of the "pre/post-install" chores that come with vanilla Debian? If any of these situations at all apply to you: 
- installing Debian with Btrfs+Snapper
- configuring Btrfs options and subvolume layout
- configuring `sudo`
- setting up timezones
- installing zRAM/zRAM-Swap
- enabling Debian Backports
- getting Bluetooth or Printers working
- installing Flatpak
- getting nonfree firmware/codecs installed on your computer
- installing Grub Customizer

...or any other things found in your common "Top 20 things to do after installing Debian" articles/YouTube videos, then Spiral Linux is for you.

The Spiral Linux website does a pretty good job explaining what Spiral Linux is and isn't, but if you need a review article then here's one of my favorites: https://fosstopia.de/spiral-linux-gnome-2024. Yeah, it's in German, but my web browser translated the page into English for me so that didn't bother me. That might work for you too. Spiral Linux is 100% Debian Stable. Which is what makes Spiral Linux glorious. It's not a derrivative work. There are no 3rd party repos/packages or distro-specific tools that might go away or have you worry about switching distros if the developer ever stops working on Spiral Linux. You get a sweet, awesome, and sanely configured Debian for the desktop that saves you time and is easy to administer.

There's a popular, negative saying about Linux that goes like this: "Linux is free if you don't value your time." With Spiral Linux, now you get to keep both your time and your money.

# Why Spiral Linux Builder Edition?

Arch Linux is a very popular and very common pick for users seeking to design and create their own system as they see fit. However, I always found Arch too minimal and too time consuming for my tastes. When picking Endeavour OS, I always found myself crafting a system that looked very similar to Spiral Linux (before I ever knew about Spiral Linux). 

Unique advantages when picking Spiral Linux Builder Edition (SLBE) over other simliar distros:

- If you're on very old hardware, you can just keep SLBE as-is and use its IceWM graphical environment (which is lighter than Xfce or LXQt). zRAM Swap helps greatly improve performance on these very old and limited machines. Gives you the freedom to choose between installing (via Synaptic or apt) lightweight GUI apps like Thunar or Mousepad/Featherpad or Terminal-centric apps like Ranger/nnn/MC file manager.
- Like Arch, you can choose the custom WM route or the full Desktop Environment route.
- You can morph Spiral Linux into other Debian distros like Kicksecure (security-hardened Debian) or Regolith Linux (uses i3 WM and GNOME applications). Rollback your system with Snapper if you don't like the changes.
- Building your system (via the Terminal) while having access to a web browser (Firefox) is really nice. Don't forget to use `nmtui` to connect to the Internet!
- Pretty damn minimal while keeping the promises made by the developer for Spiral Linux (easy to use/administer, hardware support enabled, Bluetooh/Printer support enabled, Snapper included, etc.)
