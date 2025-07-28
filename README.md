# 🚦 mcphub-lualine.nvim

## 📚 Overview

A lightweight [lualine](https://github.com/nvim-lualine/lualine.nvim) component
for [mcphub.nvim](https://github.com/ravitemer/mcphub.nvim), providing real-time
status updates for MCPHub directly in your statusline.

![demo](https://github.com/user-attachments/assets/9de78478-b957-4c32-ba0c-c3ddbc8185c2)

Note the lualine component on the top-right corner.

## ✨ Features

- Displays the MCPHub status with the number of active MCP servers or a spinner
  while starting.
- Fully compatible with lazy-loading: The lualine component is only enabled
  after mcphub.nvim loads for some other reason.
- Customizable icon and symbols.

## 🚀 Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "franco-ruggeri/mcphub-lualine.nvim",
    -- Other dependencies
  },
  opts = {
    sections = {
      lualine_x = {
        "mcphub",
        -- Other components
      },
    },
  },
}
```

> [!Note]
> The component activates only after `mcphub.nvim` is loaded (lazy
> loading). To preserve lazy loading, make sure you do not add `mcphub.nvim` as
> a dependency of lualine.

## 🛠️ Customization

You can personalize the component by providing options like these:

```lua
require('lualine').setup {
  sections = {
    lualine_x = {
      {
        "mcphub",
        icon = "󰐻 ",
        spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        stopped_symbol = "-",
      },
    },
  },
}
```

## 🙏 Acknowledgements

This plugin is based on the official
[mcphub.nvim](https://github.com/mcphub/mcphub.nvim) documentation. The main
purpose is to wrap the recommended configuration into a plugin and simplify the
configuration for the users.
