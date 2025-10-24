if true then
  return {}
end
return {
  "mfussenegger/nvim-jdtls",
  opts = {
    jdtls = function(opts)
      opts.settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-25",
                path = "$SDKMAN_CANDIDATES_DIR/java/25-zulu/",
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
