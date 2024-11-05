{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  # https://devenv.sh/basics/
  # env.GREET = "devenv";

  # https://devenv.sh/languages/
  languages.rust = {
    enable = true;
    channel = "nightly";
    mold.enable = false;
    # targets = ["thumbv7em-none-eabihf"];
    components = ["rustc" "cargo" "clippy" "rustfmt" "rust-analyzer" "rust-src" "llvm-tools-preview"];
  };

  # https://devenv.sh/scripts/
  scripts = {
    build.exec = ''
      cargo build
    '';
    build-qemu.exec = ''
      cargo bootimage
      qemu-system-x86_64 -drive format=raw,file=target/x86_64-rust_os/debug/bootimage-rust_os.bin
    '';
    run-qemu.exec = ''
      qemu-system-x86_64 -drive format=raw,file=target/x86_64-rust_os/debug/bootimage-rust_os.bin
    '';
  };

  packages = [
    pkgs.cargo-bootimage
  ];

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  # enterTest = ''
  #   echo "Running tests"
  #   git --version | grep --color=auto "${pkgs.git.version}"
  # '';

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
