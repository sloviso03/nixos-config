{ ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting ""
    '';
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true; 
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = "$directory$git_branch$git_status$cmd_duration$character";

      directory = {
        style = "bold white";
        truncation_length = 0;
      };

      git_branch = {
        format = "[ $branch ]($style)";
        style  = "bold purple";
        symbol = " ";
      };

      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
        style = "bold red";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };

      cmd_duration = {
        min_time = 2000;
        format = "[ $duration]($style) ";
        style = "yellow";
      };
    };
  };
}
