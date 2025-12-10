return {
  "mfussenegger/nvim-jdtls",
  opts = {
    jdtls = function(opts)
      opts.settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-24",
                path = "$SDKMAN_CANDIDATES_DIR/java/24.0.2-zulu/",
                default = true,
              },
            },
          },
          maven = {
            downloadSources = true,
          },
          referencesCodeLens = {
            enabled = true,
          },
        },
      }
      return opts
    end,
  },
}
