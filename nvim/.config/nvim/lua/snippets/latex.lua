local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("it", { t("\\textit{"), i(1), t("}") }),
	s("tt", { t("\\texttt{"), i(1), t("}") }),
	s("def", {
		t({ "\\begin{definition}", "\\label{definition:" }),
		i(1),
		t({ "}", "\t" }),
		i(2),
		t({ "", "\\end{definition}" }),
	}),
	s("ther", {
		t({ "\\begin{theorem}", "\\label{theorem:" }),
		i(1),
		t({ "}", "\t" }),
		i(2),
		t({ "", "\\end{theorem}" }),
	}),
	s("proof", {
		t({ "\\begin{proof}", "\\label{proof:" }),
		i(1),
		t({ "}", "\t" }),
		i(2),
		t({ "", "\\end{proof}" }),
	}),
	s("prop", {
		t({ "\\begin{proposition}", "\\label{proposition:" }),
		i(1),
		t({ "}", "\t" }),
		i(2),
		t({ "", "\\end{proposition}" }),
	}),
	s("lem", {
		t({ "\\begin{lemma}", "\\label{lemma:" }),
		i(1),
		t({ "}", "\t" }),
		i(2),
		t({ "", "\\end{lemma}" }),
	}),
	s("cor", {
		t({ "\\begin{corollary}", "\\label{corollary:" }),
		i(1),
		t({ "}", "\t" }),
		i(2),
		t({ "", "\\end{corollary}" }),
	}),
	s("exa", {
		t({ "\\begin{example}", "\t" }),
		i(1),
		t({ "", "\\end{example}" }),
	}),
	s("ali", {
		t({ "\\begin{align}", "\t" }),
		i(1),
		t({ "", "\\end{align}" }),
	}),
}
