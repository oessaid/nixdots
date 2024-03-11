{
  config,
  pkgs,
  ...
}: {
  programs.wofi = {
    enable = true;
    style = ''
      window {
      margin: 0px;
      # border: 1px solid #928374;
      border: none;
      background-color: #282828;
      }

      #input {
      margin: 5px;
      border: none;
      color: #ebdbb2;
      background-color: #1d2021;
      }

      #inner-box {
      margin: 5px;
      border: none;
      background-color: #282828;
      }

      #outer-box {
      margin: 5px;
      border: none;
      background-color: #282828;
      }

      #scroll {
      margin: 0px;
      border: none;
      }

      #text {
      margin: 5px;
      border: none;
      color: #ebdbb2;
      }

      #entry:selected {
      background-color: #1d2021;
      }
    '';
    settings = {
      width = 600;
      height = 500;
      location = "center";
      show = "drun";
      prompt = "Apps";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halignr = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 40;
      gtk_dark = true;
    };
  };
}
