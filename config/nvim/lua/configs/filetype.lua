local options = {
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

require("filetype").setup(options)
