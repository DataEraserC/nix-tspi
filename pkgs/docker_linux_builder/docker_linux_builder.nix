{pkgs, ...}:
pkgs.dockerTools.buildLayeredImage {
  # helper to build Docker image
  name = "docker_linux_builder"; # give docker image a name
  tag = "latest"; # provide a tag
  contents = with pkgs; [
    # fix https://discourse.nixos.org/t/non-interactive-bash-errors-from-flake-nix-mkshell/33310
    bashInteractive
    # fix `cc` replaced by clang, which causes nvim-treesitter compilation error
    gcc
    direnv
    ncurses
    dtc
    bc
    bison
    gnumake
    dtc
    flex
    lz4
    vim
    # create a fhs environment by command `fhs`, so we can run non-nixos packages in nixos!
    (callPackage ../fhs {})
    nettools
  ]; # packages in docker image
}
