return {
  "mfussenegger/nvim-jdtls",
  opts = {
    jdtls = function(opts)
      opts.settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-11",
                path = "$SDKMAN_CANDIDATES_DIR/java/11.0.25-tem/",
              },
              {
                name = "JavaSE-17",
                path = "$SDKMAN_CANDIDATES_DIR/java/17.0.14-tem/",
              },
              {
                name = "JavaSE-21",
                path = "$SDKMAN_CANDIDATES_DIR/java/21.0.7-tem/",
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
