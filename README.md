# nixos-config-flakes

Hello darlings, i'm gonna tell you what you should do after clonning the repo, but first clone it
```
git clone https://github.com/MrRichar02/Nixos-config.git config-flake
```

Delete the hardware-configuration.nix file in the cloned repo

```
cd config-flake
rm hardware-configuration.nix
```

Add your hardware-configuration.nix to config-flake direcotory

```
cp /etc/nixos/hardware-configuration.nix path/to/where/you/cloned/the/repo
```

Edit the configuration.nix file to change the username to match yours

```
nano configuration.nix
```

now justo run the rebuild with an special flag that gpt gave me(if it doesn't is gpt's fault)

```
sudo nixos-rebuild switch --flake path/to/where/you/cloned/the/repo --experimental-features 'nix-command flakes'
```

that should be all, now be happy :)
