{ mcphub-nvim, ...}:
{ pkgs, ...}:
let
  mcphub = mcphub-nvim.packages.${pkgs.system}.default;
  mcp-hub = pkgs.buildNpmPackage (finalAttrs: {
    pname = "mcp-hub";
    version = "4.2.1";

    src = pkgs.fetchFromGithub {
      owner = "ravitemer";
      repo = "mcp-hub";
      rev = "main";
      sha256 = "sha256-KakvXZf0vjdqzyT+LsAKHEr4GLICGXPmxl1hZ3tI7Yg=";
    };

    npmDepsHash = "sha256-nyenuxsKRAL0PU/UPSJsz8ftHIF+LBTGdygTqxti38g=";
    npmPackFlags = [ "--ignore-scripts" ];
  });

in
{
  programs.nixvim =  {
    plugins.blink-cmp = {
      settings.sources = {
        default = [ "avante" ];
        provides.avante = {
          module = "blink-cmp-avante";
          name = "Avante";
        };
      };
    };

    plugins.avante = {
      enable = true;
      settings = {
        provider = "ollama";
        providers = {
          claude = {
            endpoint = "https//api.antropic.com";
            model = "claude-3-5-haiku-latest";
            timeout = 30000;
            extra_request_body = {
              temperature = 0.75;
              max_tokens = 4096;
            };
          };

          morph = {
            model = "morph-v3-fast";
          };

          ollama = {
            endpoint = "http://localhost:11434";
            model = "codegemma:latest";
            parse_response_data = ''
              function(data_stream, event_state, opts)
                require('avante.providers').copilot.parse_response(data_stream, event_state, opts)
              end
            '';
            max_tokens = 8192;
            disable_tools = true;
          };
        };
      };
    };

    extraPlugins = [ mcphub pkgs.vimPlugins.blink-cmp-avante ];
    extraConfigLua = ''
      require("mcphub").setup({
        cmd = "${mcp-hub}/bin/mcp-hub",
        extensions = {
          avante = {
            make_slash_commands = true,
          }
        };
      })
    '';
  };
} 

