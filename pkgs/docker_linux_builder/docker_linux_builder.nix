{pkgs, ...}:
pkgs.dockerTools.buildLayeredImage {
  # helper to build Docker image
  name = "docker_linux_builder"; # give docker image a name
  tag = "latest"; # provide a tag
  contents = [pkgs.hello]; # packages in docker image
}
