{ pkgs, lib, config, ...}:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Kubernetes/Docker
        ms-kubernetes-tools.vscode-kubernetes-tools
        ms-azuretools.vscode-docker

        # NixOS
        bbenoist.nix

        # Rust
        tamasfe.even-better-toml
        vadimcn.vscode-lldb
        rust-lang.rust-analyzer

        # Git
        eamodio.gitlens
        mhutchie.git-graph

        # Misc
        redhat.vscode-yaml
        yzhang.markdown-all-in-one
        dbaeumer.vscode-eslint
        
        # Themes/Appearence
        # oderwat.indent-rainbow
        file-icons.file-icons
        
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "sweet-vscode";
          publisher = "EliverLara";
          version = "1.1.1";
          sha256 = "kJgqMEJHyYF3GDxe1rnpTEmbfJE01tyyOFjRUp4SOds="; 
        }
        {
          name = "glassit";
          publisher = "s-nlf-fh";
          version = "0.2.6";
          sha256 = "LcAomgK91hnJWqAW4I0FAgTOwr8Kwv7ZhvGCgkokKuY=";
        }
        {
          name = "sweet-vscode-icons";
          publisher = "EliverLara";
          version = "0.0.1";
          sha256 = "Mx4+PCU+ik01HaWLYHkBL4BcdfqTpWLX1DlPvcjkFw0=";
        }
        # Currently has problems building
        # {
        #   name = "sweetdracula";
        #   publisher = "PROxZIMA";
        #   version = "1.0.9";
        #   sha256 = "sha256-1SGwIsRdmN+e3QcEnribnE6LcZUNl11vZ1v/If3nZvw=";
        # }
        {
          name = "code-coverage";
          publisher = "markis";
          version = "1.9.2";
          sha256 = "sha256-QQ162C0ERc3nTdvWP9aYKx6nOiYovK21ThWFhV93EC0=";
        }
        {
          name = "todo-tree";
          publisher = "Gruntfuggly";
          version = "0.0.226";
          sha256 = "sha256-Fj9cw+VJ2jkTGUclB1TLvURhzQsaryFQs/+f2RZOLHs=";
        }
        {
          name = "markdowntable";
          publisher = "TakumiI";
          version = "0.10.4";
          sha256 = "sha256-rynWwTPsDQirKu1uhs7rHIglTay/4S1MA0M17Mdjtxw=";
        }
        {
          name = "errorlens";
          publisher = "usernamehw";
          version = "3.13.0";
          sha256 = "sha256-HslBfJsKDUGq+xdCBfYlxsWJ4xOB9flfyO2aUCqwmYM=";
        }
        {
          name = "bun-vscode";
          publisher = "oven";
          version = "0.0.11";
          sha256 = "sha256-5cuL8gf4f4Y+gEI+ZA6vjldPs8dpk+r6gaAMPD9KrUE=";
        }
        {
          name = "wokwi-vscode";
          publisher = "Wokwi";
          version = "1.5.0";
          sha256 = "sha256-hV4Kv+8bN/XA6fjVBbeMcW6K9Kjz+BhJ2F3CSDrZuPs=";
        }
        {
          name = "material-theme";
          publisher = "zhuangtongfa";
          version = "3.16.2";
          sha256 = "sha256-KYw45IdB3QoO6CYWWqga4OM0VM0lowPv8J0iYz9Jais=";
        }
        {
          name = "theme-monokai-pro-vscode";
          publisher = "monokai";
          version = "1.2.1";
          sha256 = "sha256-tRMuAqI6zqjvOCoESbJfD4fjgnA93pQ06ppvPDuwceQ=";
        }
        {
          name = "HCL";
          publisher = "HashiCorp";
          version = "0.3.2";
          sha256 = "sha256-cxF3knYY29PvT3rkRS8SGxMn9vzt56wwBXpk2PqO0mo=";
        }
        {
          name = "volar";
          publisher = "vue";
          version = "1.8.27";
          sha256 = "sha256-KfWgdz61NURmS1cwFsE9AmIrEykyN5MXIKfG8gDfmac=";
        }
        {
          name = "vscode-typescript-vue-plugin";
          publisher = "vue";
          version = "1.8.27";
          sha256 = "sha256-ym1+WPKBcn4h9lqSFVehfiDoGUEviOSEVXVLhHcYvfc=";
        }
        {
          name = "systemd-unit-file";
          publisher = "coolbear";
          version = "1.0.6";
          sha256 = "sha256-ZhxSUT3zqdPNiHnfaDp/LQiGxTSLY1Vpc5zEbpv+gGk=";
        }
        {
          name = "vim";
          publisher = "vscodevim";
          version = "1.27.2";
          sha256 = "sha256-O5G4yhvD2HvKb4Vbvr1v20nMEQq88f5RE+X50bZvr1Q=";
        }
        {
          name = "learn-vim";
          publisher = "vintharas";
          version = "0.0.28";
          sha256 = "sha256-HAEKetNHUZ1HopGeQTqkrGUWZNFWD7gMaoTNbpxqI1Y=";
        }
      ];

      userSettings = {

        # Themes
        "workbench.iconTheme"= "file-icons";
        "window.titleBarStyle"= "custom";
        "glassit.alpha"= 210;
        "workbench.colorTheme"= "Sweet Dracula";

        # Editor
        "editor.renderWhitespace"= "boundary";
        "editor.indentSize"= "tabSize";
        "editor.tabSize"= 2;
        "editor.insertSpaces"= true;
        "editor.fontFamily"= "FiraCode Nerd Font";
        "editor.lineNumbers" = "relative";

        # Terminal
        "terminal.integrated.fontSize"= 13;
        "terminal.integrated.fontFamily"= "'FiraMono Nerd Font'";

        # TypeScript
        "typescript.tsdk"= "./node_modules/typescript/lib";
        "typescript.enablePromptUseWorkspaceTsdk"= true;
        "typescript.updateImportsOnFileMove.enabled"= "always";

        # Rust
        "rust-analyzer.checkOnSave"= true;

        # Misc
        "explorer.confirmDelete"= false;
        "explorer.confirmDragAndDrop"= false;
        
        "security.workspace.trust.untrustedFiles"= "open";

        "git.openRepositoryInParentFolders"= "never";

        "vs-kubernetes"= {
            "vs-kubernetes.crd-code-completion"= "enabled";
        };

        "redhat.telemetry.enabled"= false;

      };
    };
  };

  home.file = {
    ".config/Code/User/keybindings.json".text = ''
      [
        {
          "key": "ctrl+[Semicolon]",
          "command": "workbench.action.terminal.toggleTerminal"
        },
        {
          "key": "shift+alt+[BracketRight]",
          "command": "workbench.action.terminal.split",
          "when": "terminalFocus && terminalProcessSupported || terminalFocus && terminalWebExtensionContributedProfile"
        },
        {
          "key": "ctrl+shift+5",
          "command": "-workbench.action.terminal.split",
          "when": "terminalFocus && terminalProcessSupported || terminalFocus && terminalWebExtensionContributedProfile"
        },
        {
          "key": "shift+alt+-",
          "command": "workbench.action.terminal.splitActiveTab",
          "when": "terminalProcessSupported && terminalTabsFocus"
        },
        {
          "key": "ctrl+shift+5",
          "command": "-workbench.action.terminal.splitActiveTab",
          "when": "terminalProcessSupported && terminalTabsFocus"
        },
        {
          "key": "shift+alt+[BracketRight]",
          "command": "workbench.action.splitEditorRight"
        },
        {
          "key": "shift+alt+-",
          "command": "workbench.action.splitEditorDown"
        },
        {
          "key": "shift+alt+right",
          "command": "workbench.action.moveActiveEditorGroupRight"
        },
        {
          "key": "ctrl+k right",
          "command": "-workbench.action.moveActiveEditorGroupRight"
        },
        {
          "key": "shift+alt+left",
          "command": "workbench.action.moveActiveEditorGroupLeft"
        },
        {
          "key": "ctrl+k left",
          "command": "-workbench.action.moveActiveEditorGroupLeft"
        },
        {
          "key": "ctrl+[Backslash]",
          "command": "editor.action.commentLine",
          "when": "editorTextFocus && !editorReadonly"
        },
        {
          "key": "ctrl+p",
          "command": "-workbench.action.quickOpen"
        },
        {
          "key": "ctrl+alt+p",
          "command": "workbench.action.quickOpen"
        },
        {
          "key": "ctrl+alt+b",
          "command: "workbench.action.toggleSidebarVisibility"
        },
        {
          "key": "ctrl+b",
          "command": "-workbench.action.toggleSidebarVisibility"
        }

      ]
    '';
  };
}
