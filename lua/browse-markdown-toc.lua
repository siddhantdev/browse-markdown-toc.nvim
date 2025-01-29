local M = {}

function M.show_toc()
    local bufnr = vim.api.nvim_get_current_buf()
    local parser = assert(vim.treesitter.get_parser(bufnr, 'markdown', { error = false }))
    local query = vim.treesitter.query.parse(
        parser:lang(),
        [[
        (atx_heading
          (atx_h1_marker) @h1.marker
          (inline) @h1.content) @h1.container

        (atx_heading
          (atx_h2_marker) @h2.marker
          (inline) @h2.content) @h2.container

        (atx_heading
          (atx_h3_marker) @h3.marker
          (inline) @h3.content) @h3.container

        (atx_heading
          (atx_h4_marker) @h4.marker
          (inline) @h4.content) @h4.container

        (atx_heading
          (atx_h5_marker) @h5.marker
          (inline) @h5.content) @h5.container

        (atx_heading
          (atx_h6_marker) @h6.marker
          (inline) @h6.content) @h6.container

        (setext_heading
          (paragraph) @h1.content
          (setext_h1_underline) @h1.marker) @h1.container

        (setext_heading
          (paragraph) @h2.content
          (setext_h2_underline) @h2.marker) @h2.container
        ]]
    )
    local root = parser:parse()[1]:root()
    local headings = {}
    for id, node, _, _ in query:iter_captures(root, bufnr) do
        local text = vim.treesitter.get_node_text(node, bufnr)
        local capture = query.captures[id]
        local row, col = node:start()
        if vim.endswith(capture, "content") then
            table.insert(headings, {
                bufnr = bufnr,
                lnum = row + 1,
                text = text
            })
        end
    end

    vim.fn.setloclist(0, headings, ' ')
    vim.fn.setloclist(0, {}, 'a', { title = 'TOC' })
    vim.cmd.lopen()
end

function M.setup()
    vim.api.nvim_create_user_command("ShowToc", M.show_toc, {})
end

return M
