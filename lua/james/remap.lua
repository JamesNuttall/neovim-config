vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set('i', '<Tab>', function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, { desc = "Super Tab" })

vim.keymap.set("n", "<leader>t", function()
    local is_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree")
    is_git_repo = string.gsub(is_git_repo, "\n", "")

    if is_git_repo == "true" then
        -- if open close else open
        local project_root = vim.fn.system("git rev-parse --show-toplevel") .. "/"
        project_root = string.gsub(project_root, "\n", "")

        local todo_file = project_root .. "TODO"
        vim.cmd("vs " .. todo_file)
        --print(project_root.gsub(project_root, "\n", ""))
        --local working_directory = vim.fn.getcwd() .. "/"
        --       print(working_directory)

        --        print(todo_file)
        -- open file in left buffer
        --  vim.cmd("vs")
        --       vim.cmd("e " .. todo_file)

        --        local curline = vim.api.nvim_get_current_line()
        --        local working_directory = vim.fn.getcwd() .. "/"
        --        vim.cmd("vs")
        --        vim.cmd("e " .. working_directory .. curline)
    end
end)
