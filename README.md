# Browse Markdown TOC

A simple plugin which lets you browse the headings of a markdown file in neovim like the TOC in help files.

## Installation

With `lazy.nvim`, you can install the plugin like this:

```lua
{
    'siddhantdev/browse-markdown-toc.nvim',
    ft = { "markdown" }
    opts = {}
}
```

## Usage

In a markdown file, the command `ShowToc` opens the file's table of contents.

