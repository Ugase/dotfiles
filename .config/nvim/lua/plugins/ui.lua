return {
  {
    "echasnovski/mini.starter",
    version = false,
    event = "VimEnter",
    config = function()
      require("mini.starter").setup({
        query_updaters = "",
        footer = "",
        header = "\n                                    oo            \n                                                  \n88d888b. .d8888b. .d8888b. dP   .dP dP 88d8b.d8b. \n88'  `88 88ooood8 88'  `88 88   d8' 88 88'`88'`88 \n88    88 88.  ... 88.  .88 88 .88'  88 88  88  88 \ndP    dP `88888P' `88888P' 8888P'   dP dP  dP  dP \n                                                  \n",
      })
    end,
  },
}
