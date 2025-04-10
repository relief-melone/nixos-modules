{ pkgs, ... }: 
{

  programs.nixvim = {

    plugins = {
      dap.enable = true;
      dap-ui.enable = true;
      dap-virtual-text.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      nvim-gdb
    ];

    keymaps = [      
      # Dap
      { mode = "n"; action = "<cmd>DapToggleBreakpoint<cr>";  key = "<leader>b"; }
      { mode = "n"; action = "<cmd>DapContinue<cr>"; key = "<F5>"; }
      { mode = "n"; action = "<cmd>DapStepOver<cr>"; key = "<F10>"; }
      { mode = "n"; action = "<cmd>DapStepInto<cr>"; key = "<F11>"; }
      { mode = "n"; action = "<cmd>DapStepOut<cr>"; key = "<F12>"; }
      { mode = "n"; action = "<cmd>lua function() require 'dap'.set_breakpooint(vim.fn.input('Breakpoint condition: '))<cr>"; key = "<leader>B"; }

      # Dap-ui
      { mode = "n"; action = "<cmd>lua require(\"dapui\").toggle()<cr>"; key = "<leader>d"; }

    ];


    extraConfigLua = ''
      local dap, dapui = require("dap"), require("dapui")

      -- DEBUG LISTENERS
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      dap.set_log_level('DEBUG')
    '';
  };


}
