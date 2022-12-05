local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep

require("luasnip.loaders.from_vscode").lazy_load()


ls.add_snippets("rust", {
    s({trig= "prd", dscr= "Named debug print {:?}"}, {
        t("println!(\""), i(1, "var"), t(" = {:?}\", "), rep(1), t(");")
    })
})
