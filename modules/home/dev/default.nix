{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # lsp servers
    gopls
    clang-tools       
    typescript-language-server  
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
    android-tools
    android-studio    
  ];


  home.sessionVariables = {
    ANDROID_HOME = "$HOME/Android/Sdk";
    ANDROID_SDK_ROOT = "$HOME/Android/Sdk";
  };

}
