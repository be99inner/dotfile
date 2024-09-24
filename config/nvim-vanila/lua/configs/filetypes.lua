-- by extension
local extensions = {
  tf = "terraform",
}

-- by filename
local filenames = {}

-- by patterns
local patterns = {
  -- kubeconfig
  ["~/.kube/config.*"] = "yaml",
  -- readme
  [".*README.(%a+)"] = function(path, bufnr, ext)
    if ext == "md" then
      return "markdown"
    elseif ext == "rst" then
      return "rst"
    end
  end,
}

-- add filetype to neovim configuration
vim.filetype.add({
  extension = extensions,
  filename = filenames,
  pattern = patterns,
})
