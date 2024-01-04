require("filetype").setup {
  overrides = {
    extensions = {
      tf = "terraform",
      tfvars = "terraform",
      tfstate = "json",
      sh = "sh",
    },
    complex = {
      ["/%.kube/config"] = "yaml",
    },
  },
}
