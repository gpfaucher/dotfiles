k_: {
  programs.nixvim.plugins = {
    lspkind = {
      enable = true;
      symbolMap = {
        Copilot = "";
      };
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };

    luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
    };

    lspsaga = {
      enable = true;
      symbolInWinbar.enable = false;
      lightbulb.virtualText = false;
    };

    lsp = {
      enable = true;
      servers = {
        ts_ls.enable = true;
        cssls.enable = true;
        tailwindcss.enable = true;
        html.enable = true;
        astro.enable = true;
        phpactor.enable = true;
        svelte.enable = false;
        vuels.enable = false;
        pyright.enable = true;
        marksman.enable = true;
        nil_ls.enable = true;
        dockerls.enable = true;
        bashls.enable = true;
        clangd.enable = true;
        csharp_ls.enable = true;
        yamlls.enable = true;

        ltex = {
          enable = true;
          settings = {
            enabled = [ "astro" "html" "latex" "markdown" "text" "tex" "gitcommit" ];
            completionEnabled = true;
            language = "en-US de-DE nl";
          };
        };

        gopls = {
          enable = true;
          autostart = true;
        };

        lua_ls = {
          enable = true;
          settings.telemetry.enable = false;
        };

        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
      };
    };
  };

  programs.nixvim.keymaps = [
    {
      action = "<cmd>Lspsaga hover_doc<cr>";
      key = "K";
      options = {
        silent = true;
      };
    }
    {
      action = "<cmd>Lspsaga finder<cr>";
      key = "gi";
      options = {
        silent = true;
      };
    }
    {
      action = "<cmd>Lspsaga rename<cr>";
      key = "gr";
      options = {
        silent = true;
      };
    }
    {
      action = "<cmd>Lspsaga code_action<cr>";
      key = "ga";
      options = {
        silent = true;
      };
    }
    {
      action = "<cmd>Lspsaga term_toggle<cr>";
      key = "gt";
      options = {
        silent = true;
      };
    }
    {
      action = "<cmd>Lspsaga code_action<cr>";
      key = "ga";
      options = {
        silent = true;
      };
    }
    {
      action = "<cmd>Lspsaga show_workspace_diagnostics<cr>";
      key = "<leader>pw";
      options = {
        silent = true;
      };
    }
    {
      action = "<cmd>Lspsaga show_line_diagnostics<cr>";
      key = "<leader>p";
      options = {
        silent = true;
      };
    }
    {
      action = "<cmd>Lspsaga goto_definition<cr>";
      key = "gd";
      options = {
        silent = true;
      };
    }
  ];
}
