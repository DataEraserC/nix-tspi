FROM nixos/nix:latest
LABEL maintainer="dataeraserc 102341238+DataEraserC@users.noreply.github.com"
RUN cp -a /etc/nix/nix.conf /etc/nix/nix.conf.bak
RUN echo "build-users-group = nixbld" > /etc/nix/nix.conf
RUN echo "sandbox = false" >> /etc/nix/nix.conf
RUN echo "trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" >> /etc/nix/nix.conf
RUN echo "substituters =  https://mirror.sjtu.edu.cn/nix-channels/store https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store https://mirrors.ustc.edu.cn/nix-channels/store https://cache.nixos.org/" >> /etc/nix/nix.conf
RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf

RUN nix shell nixpkgs#git --impure --command "git clone --recurse-submodules --depth=1 https://github.com/DataEraserC/nix-tspi.git"
RUN cd nix-tspi && NIXPKGS_ALLOW_INSECURE=1 nix build .#docker_linux_builder
