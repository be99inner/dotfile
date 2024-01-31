require("filetype").setup {
  overrides = {
    extensions = {
      tf = "terraform",
      tfvars = "terraform",
      tfstate = "json",
      sh = "sh",
      env = "dotenv",
    },
    complex = {
      ["/%.kube/config"] = "yaml",
      ["/%.env.?"] = "dotenv",
    },
  },
}
