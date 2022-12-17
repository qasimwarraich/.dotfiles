local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local rep = extras.rep

require("luasnip.loaders.from_vscode").lazy_load()


ls.add_snippets("rust", {
    s({ trig = "prd", name = "Debug Print", dscr = "Allows for a named debug print using {:?}" }, {
        t("println!(\""), i(1, "var"), t(" = {:?}\", "), rep(1), t(");")
    })
})

ls.add_snippets("go", {
    s({ trig = "erf", name = "Log fatal error", dscr = "Checks if err exists and logs fatally" },
        fmt([[
if err != nil {{
    log.Fatal(err)
}}]]     , {})
    )
})
