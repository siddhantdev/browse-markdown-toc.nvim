# Browse Markdown TOC

A simple plugin which lets you browse the headings of a markdown file in neovim like the TOC in help files.

## Installation

With `lazy.nvim`, you can install the plugin like this:

```lua
{
    'siddhantdev/browse-markdown-toc.nvim',
    ft = { "markdown" },
    opts = {}
}
```

If you are using any other plugin, make sure to call `require('browse-markdown-toc').setup()`

## Usage

In a markdown file, the command `ShowToc` opens the file's table of contents.

## Configuration

By default, the plugin maps `gO` to the command. This can be turned off by setting `keymap = false` in `opts` or passing it as a key to opts:
```lua
require('browse-markdown-toc').setup({
    keymap = false
})
```
