local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local conds = require 'luasnip.extras.conditions'
local conds_expand = require 'luasnip.extras.conditions.expand'

local function get_date()
  return os.date '%Y-%m-%dT%H:%M:%S+08:00'
end

return {
  s('date', {
    f(get_date, {}),
  }),
  s('---', {
    t { '---', 'title: ' },
    i(1, 'insert title here...'),
    t { '', 'date: ' },
    f(get_date, {}),
    t { '', '---', '' },
    i(2),
  }),
  s('tag', {
    t { 'tags:', '  - ' },
    i(1, 'insert tags here...'),
  }),
  s('cond2', {
    t 'will only expand at the beginning of the line',
  }, {
    condition = conds_expand.line_begin,
  }),
}
