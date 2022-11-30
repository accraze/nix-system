# nix-system

nix-darwin system for M1 Macos

## Build / Restart

```
nix build .#darwinConfigurations.accraze-work.system
./result/sw/bin/darwin-rebuild switch --flake .
```
