usage:
(In nix docker)
NIXPKGS_ALLOW_INSECURE=1 nix build github:DataEraserC/nix-tspi#docker_linux_builder --impure
fhs -c "FORCE_UNSAFE_CONFIGURE=1 command"
