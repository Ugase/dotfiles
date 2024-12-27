return {
  {
    "echasnovski/mini.starter",
    version = false,
    event = "VimEnter",
    config = function()
      require("mini.starter").setup({
        query_updaters = "",
        footer = "",
        header = "\n                              iii             \nnn nnn    eee   oooo  vv   vv     mm mm mmmm  \nnnn  nn ee   e oo  oo  vv vv  iii mmm  mm  mm \nnn   nn eeeee  oo  oo   vvv   iii mmm  mm  mm \nnn   nn  eeeee  oooo     v    iii mmm  mm  mm \n",
      })
    end,
  },
}
