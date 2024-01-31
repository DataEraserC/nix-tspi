{nixpkgs,forAllSystems, ...}:
forAllSystems (
  system: let
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    default = pkgs.mkShell {
      packages = with pkgs; [
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
        (
          let
            base = pkgs.appimageTools.defaultFhsEnvArgs;
          in
            pkgs.buildFHSUserEnv (base
              // {
                name = "fhs";
                targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [pkgs.pkg-config];
                profile = "export FHS=1";
                runScript = "bash";
                extraOutputsToInstall = ["dev"];
              })
        )
      ];
      name = "dots";
      shellHook = ''
      '';
    };
  }
)