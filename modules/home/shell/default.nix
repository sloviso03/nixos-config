{ ... }:
{
  programs.bash = {
    enable = true;  
    bashrcExtra = ''
      
    '';
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true; 
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      format = "$directory$git_branch$git_status$cmd_duration$character";

      directory = {
        style = "bold white";
        truncation_length = 0;
        truncate_to_repo = false;
        home_symbol = "~";
      };

      git_branch = {
        format = "[ $branch ]($style)";
        style  = "bold purple";
        symbol = " ";
      };

      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
        style = "bold red";
        ahead = "↑$count";
        behind = "↓$count";
        diverged = "↑$ahead_count↓$behind_count";
        modified = "!";
        untracked = "?";
        staged = "+";
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
