# My NixOS Configuration

This repository contains my **NixOS configuration**, built with [Nix Flakes](https://nixos.wiki/wiki/Flakes) and a modular structure. It allows you to reproduce the same system setup on your machine.

---

## ❄️ Requirements

Before you begin:

- A fresh [NixOS installation](https://nixos.org/download.html)
- `nix` command available
- Git installed

---

## 🚀 Getting Started

1. **Clone this repository**:

   ```bash
   git clone https://github.com/yourusername/your-nixos-config.git
   cd your-nixos-config
   ```

2. **Generate your own hardware configuration**:

   If you're on a new install, run:

   ```bash
   sudo nixos-generate-config --root /mnt
   ```

   Replace the existing `hardware-configuration.nix` in this repo with the one generated for your system.

3. **Apply the configuration**:

   Use the `--experimental-features` flag to enable flakes without modifying config files:

   ```bash
   sudo nixos-rebuild switch --flake .# --experimental-features 'nix-command flakes'
   ```

   > Tip: If your `flake.nix` defines multiple hosts, replace `.#` with `.#your-hostname`.

---

## 🧱 Configuration Structure

This repo follows a modular design. All system options are under the `modules/` directory:

- `modules/audio.nix` – audio setup
- `modules/hyprland.nix` – window manager config
- `modules/virtmanager.nix` – virtualization support
- `modules/style/` – theming and appearance

Main files:

- `flake.nix` – Main entry point for the system definition
- `hardware-configuration.nix` – Hardware-specific config (you should replace this)
- `configuration.nix` – Optionally used by the flake as a system config

---

## 🛠 Customization

To adapt this config to your system:

- Replace `hardware-configuration.nix` with your own
- Update `modules/user.nix` with your username and user-specific settings
- Tweak or add modules under `modules/` as needed

---

## 📄 License

This configuration is shared under an open license. Feel free to fork and modify it.

---

## 📬 Contact

If you have questions or ideas, feel free to open an issue or pull request.

