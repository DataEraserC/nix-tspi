{pkgs, ...}:
pkgs.dockerTools.buildLayeredImage {
  # helper to build Docker image
  name = "docker_linux_builder"; # give docker image a name
  tag = "latest"; # provide a tag
  contents =
    (with pkgs; [
      # whiptail
      newt

      # build-essential
      gcc_7

      # crossbuild-essential-arm64

      # bash-completion
      bash-completion

      # vim
      vim

      # sudo
      sudo

      # locales
      glibc

      # time
      time

      # rsync
      rsync

      # bc
      bc

      # python
      python2
      python3
    ])
    ++ (with pkgs; [
      # repo
      git-repo

      # git
      git

      # ssh
      openssh

      # libssl-dev
      openssl
      openssl.dev

      # liblz4-tool
      lz4

      # lib32stdc++6
      # pkgs.stdenv.cc.cc.lib

      # expect
      expect

      # patchelf
      patchelf

      # chrpath
      chrpath

      # gawk
      gawk

      # texinfo
      texinfo

      # diffstat
      diffstat

      # binfmt-support

      # qemu-user-static
      qemu

      # live-build

      # bison
      bison

      # flex
      flex

      # fakeroot
      fakeroot

      # cmake
      cmake

      # unzip
      unzip
      # device-tree-compiler
      dtc
      # python-pip
      (python311Packages.pip)

      # ncurses-dev
      ncurses.dev
      ncurses

      # python-pyelftools
      python311Packages.pyelftools

      # subversion
      subversion

      # asciidoc
      asciidoc

      # w3m
      w3m

      # dblatex
      dblatex

      # graphviz
      graphviz

      # python-matplotlib
      python311Packages.matplotlib

      # cpio
      cpio

      # libparse-yapp-perl
      perl538Packages.ParseYapp

      # default-jre
      jre8

      # patchutils
      patchutils

      # swig
      swig

      # expect-dev
      expect.dev

      # u-boot-tools
      ubootTools
    ])
    ++ (with pkgs; [
      # bear
      bear
    ])
    ++ (with pkgs; [
      # create a fhs environment by command `fhs`, so we can run non-nixos packages in nixos!
      (callPackage ../fhs {})

      # hostname command provider
      nettools

      # useradd command provider
      shadow
    ]); # packages in docker image
}
