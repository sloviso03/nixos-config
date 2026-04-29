{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    neovim
    git
    gcc
    gnumake
    unzip
    wget
    curl
    ripgrep
    fd

    gopls
    go
    clang
    clang-tools
    omnisharp-roslyn
    dotnet-sdk
    jdt-language-server
    kotlin-language-server
    kotlin
    nodejs_22

    lazygit
    tree-sitter
  ];
}
