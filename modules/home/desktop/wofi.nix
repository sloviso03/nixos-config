{ ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      width = 500;
      height = 300;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 24;
      sort_order = "alphabetical";
      disable_cache = true;
    };
    style = ''
      window {
        margin: 0px;
        border: 2px solid #cccccc;
        background-color: #000000;
        border-radius: 12px;
        font-family: "JetBrainsMono Nerd Font Mono";
        font-size: 14px;
      }

      #outer-box {
        margin: 5px;
        border: none;
        background-color: transparent;
      }

      #input {
        margin: 5px;
        border: none;
        color: #ffffff;
        background-color: #1a1a1a;
        border-radius: 8px;
        padding: 8px;
      }

      #inner-box {
        margin: 5px;
        border: none;
        background-color: transparent;
      }

      #scroll {
        margin: 0px;
        border: none;
      }

      #text {
        margin: 5px;
        border: none;
        color: #666666;
      }

      #entry {
        border: none;
        border-radius: 8px;
      }

      #entry:selected {
        background-color: #cccccc;
      }

      #entry:selected #text {
        color: #000000;
        font-weight: bold;
      }

      #img {
        margin-right: 10px;
      }
    '';
  };
}