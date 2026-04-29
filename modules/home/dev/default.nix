{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # lsp servers
    gopls
    clang-tools       
    nodePackages.typescript-language-server  
    jdt-language-server                     
    kotlin-language-server

    # runtimes
    go
    jdk21
    nodejs
    dotnet-sdk
    gcc
    
    # ides
    vscode
    jetbrains-toolbox    
  ];
}
