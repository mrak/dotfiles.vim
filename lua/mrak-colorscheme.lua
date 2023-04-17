-- Copied from RRethy/nvim-base16
-- Some useful links for making your own colorscheme:
-- https://github.com/chriskempson/base16
-- https://colourco.de/
-- https://color.adobe.com/create/color-wheel
-- http://vrl.cs.brown.edu/color

local M = {}
local hex_re = vim.regex('#\\x\\x\\x\\x\\x\\x')

local HEX_DIGITS = {
        ['0'] = 0,
        ['1'] = 1,
        ['2'] = 2,
        ['3'] = 3,
        ['4'] = 4,
        ['5'] = 5,
        ['6'] = 6,
        ['7'] = 7,
        ['8'] = 8,
        ['9'] = 9,
        ['a'] = 10,
        ['b'] = 11,
        ['c'] = 12,
        ['d'] = 13,
        ['e'] = 14,
        ['f'] = 15,
        ['A'] = 10,
        ['B'] = 11,
        ['C'] = 12,
        ['D'] = 13,
        ['E'] = 14,
        ['F'] = 15,
}

local function hex_to_rgb(hex)
    return HEX_DIGITS[string.sub(hex, 1, 1)] * 16 + HEX_DIGITS[string.sub(hex, 2, 2)],
        HEX_DIGITS[string.sub(hex, 3, 3)] * 16 + HEX_DIGITS[string.sub(hex, 4, 4)],
        HEX_DIGITS[string.sub(hex, 5, 5)] * 16 + HEX_DIGITS[string.sub(hex, 6, 6)]
end

local function rgb_to_hex(r, g, b)
    return bit.tohex(bit.bor(bit.lshift(r, 16), bit.lshift(g, 8), b), 6)
end

local function darken(hex, pct)
    pct = 1 - pct
    local r, g, b = hex_to_rgb(string.sub(hex, 2))
    r = math.floor(r * pct)
    g = math.floor(g * pct)
    b = math.floor(b * pct)
    return string.format("#%s", rgb_to_hex(r, g, b))
end

-- This is a bit of syntactic sugar for creating highlight groups.
--
-- local colorscheme = require('colorscheme')
-- local hi = colorscheme.highlight
-- hi.Comment = { guifg='#ffffff', guibg='#000000', gui='italic', guisp=nil }
-- hi.LspDiagnosticsDefaultError = 'DiagnosticError' -- Link to another group
--
-- This is equivalent to the following vimscript
--
-- hi Comment guifg=#ffffff guibg=#000000 gui=italic
-- hi! link LspDiagnosticsDefaultError DiagnosticError
M.highlight = setmetatable({}, {
    __newindex = function(_, hlgroup, args)
        if ('string' == type(args)) then
            vim.cmd(('hi! link %s %s'):format(hlgroup, args))
            return
        end

        local guifg, guibg, gui, guisp = args.guifg or 'NONE', args.guibg or 'NONE', args.gui or 'NONE', args.guisp or 'NONE'
        local cmd = { 'hi', hlgroup }
        if guifg then table.insert(cmd, 'guifg=' .. guifg) end
        if guibg then table.insert(cmd, 'guibg=' .. guibg) end
        if gui then table.insert(cmd, 'gui=' .. gui) end
        if guisp then table.insert(cmd, 'guisp=' .. guisp) end
        vim.cmd(table.concat(cmd, ' '))
    end
})

function M.with_config(config)
    M.config = vim.tbl_extend("force", {
        telescope = true,
        telescope_borders = false,
        indentblankline = true,
        notify = true,
        ts_rainbow = true,
        cmp = true,
        illuminate = true,
        lsp_semantic = true,
        mini_completion = true,
    }, config or M.config or {})
end

--- Creates a base16 colorscheme using the colors specified.
--
-- Builtin colorschemes can be found in the M.colorschemes table.
--
-- The default Vim highlight groups (including User[1-9]), highlight groups
-- pertaining to Neovim's builtin LSP, and highlight groups pertaining to
-- Treesitter will be defined.
--
-- It's worth noting that many colorschemes will specify language specific
-- highlight groups like rubyConstant or pythonInclude. However, I don't do
-- that here since these should instead be linked to an existing highlight
-- group.
--
-- @param colors (table) table with keys 'bottom', 'lowest', 'lower',
--   'low', 'high', 'higher', 'highest', 'top', 'red', 'orange',
--   'yellow', 'green', 'cyan', 'blue', 'purple', 'brown'. Each key should
--   map to a valid 6 digit hex color. If a string is provided, the
--   corresponding table specifying the colorscheme will be used.
function M.setup(colors, config)
    M.with_config(config)

    if type(colors) == 'string' then
        colors = M.colorschemes[colors]
    end

    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end
    vim.cmd('set termguicolors')

    M.colors                              = colors or M.colorschemes[vim.env.BASE16_THEME] or
        M.colorschemes['dark']
    local hi                              = M.highlight

    -- Vim editor colors
    hi.Normal                             = { guifg = M.colors.higher, guibg = M.colors.lowest, gui = nil, guisp = nil }
    hi.Bold                               = { guifg = nil, guibg = nil, gui = 'bold', guisp = nil }
    hi.Debug                              = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.Directory                          = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.Error                              = { guifg = M.colors.red, guibg = nil, gui = 'bold', guisp = nil }
    hi.ErrorMsg                           = { guifg = M.colors.red, guibg = nil, gui = 'bold', guisp = nil }
    hi.Exception                          = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.EndOfBuffer                        = { guifg = M.colors.bottom, guibg = M.colors.bottom, gui = nil, guisp = nil }
    hi.FoldColumn                         = { guifg = nil, guibg = M.colors.lowest, gui = nil, guisp = nil }
    hi.Folded                             = { guifg = M.colors.low, guibg = M.colors.bottom, gui = nil, guisp = nil }
    hi.IncSearch                          = { guifg = M.colors.lowest, guibg = M.colors.orange, gui = 'none', guisp = nil }
    hi.Italic                             = { guifg = nil, guibg = nil, gui = 'none', guisp = nil }
    hi.Macro                              = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
    hi.MatchParen                         = { guifg = M.colors.lowest, guibg = M.colors.high, gui = nil, guisp = nil }
    hi.ModeMsg                            = { guifg = M.colors.green, guibg = nil, gui = nil, guisp = nil }
    hi.MoreMsg                            = { guifg = M.colors.green, guibg = nil, gui = nil, guisp = nil }
    hi.Question                           = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
    hi.Search                             = { guifg = nil, guibg = nil, gui = 'reverse', guisp = nil }
    hi.Substitute                         = { guifg = M.colors.lowest, guibg = M.colors.yellow, gui = 'none', guisp = nil }
    hi.SpecialKey                         = { guifg = M.colors.low, guibg = nil, gui = nil, guisp = nil }
    hi.TooLong                            = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.Underlined                         = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.Visual                             = { guifg = M.colors.top, guibg = M.colors.low, gui = nil, guisp = nil }
    hi.VisualNOS                          = { guifg = M.colors.red, guibg = nil, gui = 'reverse', guisp = nil }
    hi.WarningMsg                         = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.WildMenu                           = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.Title                              = { guifg = M.colors.blue, guibg = nil, gui = 'none', guisp = nil }
    hi.Conceal                            = { guifg = M.colors.blue, guibg = M.colors.lowest, gui = nil, guisp = nil }
    hi.Cursor                             = { guifg = M.colors.bottom, guibg = M.colors.top, gui = nil, guisp = nil }
    hi.NonText                            = { guifg = M.colors.low, guibg = nil, gui = nil, guisp = nil }
    hi.LineNr                             = { guifg = M.colors.low, guibg = M.colors.bottom, gui = nil, guisp = nil }
    hi.SignColumn                         = { guifg = M.colors.low, guibg = M.colors.bottom, gui = nil, guisp = nil }
    hi.StatusLine                         = { guifg = M.colors.lowest, guibg = M.colors.high, gui = 'bold', guisp = nil }
    hi.StatusLineNor                      = { guifg = M.colors.lowest, guibg = M.colors.high, gui = 'bold', guisp = nil }
    hi.StatusLineIns                      = { guifg = M.colors.lowest, guibg = M.colors.green, gui = 'bold', guisp = nil }
    hi.StatusLineRep                      = { guifg = M.colors.lowest, guibg = M.colors.purple, gui = 'bold', guisp = nil }
    hi.StatusLineVRep                     = { guifg = M.colors.lowest, guibg = M.colors.purple, gui = 'bold', guisp = nil }
    hi.StatusLineNC                       = { guifg = M.colors.high, guibg = M.colors.lowest, gui = nil, guisp = nil }
    hi.WinBar                             = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
    hi.WinBarNC                           = { guifg = M.colors.high, guibg = nil, gui = 'none', guisp = nil }
    hi.VertSplit                          = { guifg = M.colors.bottom, guibg = M.colors.bottom, gui = 'none', guisp = nil }
    hi.ColorColumn                        = { guifg = M.colors.low, guibg = M.colors.lowest, gui = 'none', guisp = nil }
    hi.CursorColumn                       = { guifg = M.colors.low, guibg = M.colors.bottom, gui = 'none', guisp = nil }
    hi.CursorLine                         = { guifg = nil, guibg = M.colors.lower, gui = nil, guisp = nil }
    hi.CursorLineNr                       = { guifg = M.colors.low, guibg = M.colors.bottom, gui = nil, guisp = nil }
    hi.QuickFixLine                       = { guifg = nil, guibg = M.colors.lowest, gui = 'none', guisp = nil }
    hi.PMenu                              = { guifg = M.colors.high, guibg = M.colors.low, gui = 'none', guisp = nil }
    hi.PMenuSel                           = { guifg = M.colors.lowest, guibg = M.colors.green, gui = nil, guisp = nil }
    hi.TabLine                            = { guifg = M.colors.low, guibg = M.colors.bottom, gui = 'none', guisp = nil }
    hi.TabLineFill                        = { guifg = M.colors.low, guibg = M.colors.bottom, gui = 'none', guisp = nil }
    hi.TabLineSel                         = { guifg = M.colors.green, guibg = M.colors.lowest, gui = 'none', guisp = nil }

    -- Standard syntax highlighting
    hi.Boolean                            = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.Character                          = { guifg = M.colors.orange, guibg = nil, gui = nil, guisp = nil }
    hi.Comment                            = { guifg = M.colors.low, guibg = nil, gui = nil, guisp = nil }
    hi.Conditional                        = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.Constant                           = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.Define                             = { guifg = M.colors.yellow, guibg = nil, gui = 'none', guisp = nil }
    hi.PreCondit                          = { guifg = M.colors.yellow, guibg = nil, gui = 'none', guisp = nil }
    hi.Delimiter                          = { guifg = M.colors.cyan, guibg = nil, gui = nil, guisp = nil }
    hi.Float                              = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.Function                           = { guifg = M.colors.green, guibg = nil, gui = nil, guisp = nil }
    hi.Identifier                         = { guifg = M.colors.green, guibg = nil, gui = 'none', guisp = nil }
    hi.Include                            = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
    hi.Keyword                            = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.Label                              = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.Number                             = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.Operator                           = { guifg = M.colors.cyan, guibg = nil, gui = 'none', guisp = nil }
    hi.PreProc                            = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
    hi.Repeat                             = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.Special                            = { guifg = M.colors.cyan, guibg = nil, gui = nil, guisp = nil }
    hi.SpecialChar                        = { guifg = M.colors.cyan, guibg = nil, gui = nil, guisp = nil }
    hi.Statement                          = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.StorageClass                       = { guifg = M.colors.purple, guibg = nil, gui = nil, guisp = nil }
    hi.String                             = { guifg = M.colors.orange, guibg = nil, gui = nil, guisp = nil }
    hi.Structure                          = { guifg = M.colors.purple, guibg = nil, gui = nil, guisp = nil }
    hi.Tag                                = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
    hi.Todo                               = { guifg = M.colors.yellow, guibg = M.colors.lowest, gui = nil, guisp = nil }
    hi.Type                               = { guifg = M.colors.purple, guibg = nil, gui = 'none', guisp = nil }
    hi.Typedef                            = { guifg = M.colors.purple, guibg = nil, gui = nil, guisp = nil }

    -- Diff highlighting
    hi.DiffAdd                            = { guifg = M.colors.lowest, guibg = M.colors.green, gui = 'bold', guisp = nil }
    hi.DiffChange                         = { guifg = M.colors.lowest, guibg = M.colors.purple, gui = 'bold', guisp = nil }
    hi.DiffDelete                         = { guifg = M.colors.lowest, guibg = M.colors.bottom, gui = nil, guisp = nil }
    hi.DiffText                           = { guifg = M.colors.lowest, guibg = M.colors.purple, gui = 'bold', guisp = nil }
    hi.DiffAdded                          = { guifg = M.colors.green, guibg = M.colors.bottom, gui = nil, guisp = nil }
    hi.DiffFile                           = { guifg = M.colors.cyan, guibg = M.colors.bottom, gui = nil, guisp = nil }
    hi.DiffNewFile                        = { guifg = M.colors.cyan, guibg = M.colors.bottom, gui = 'bold', guisp = nil }
    hi.DiffLine                           = { guifg = M.colors.blue, guibg = M.colors.bottom, gui = nil, guisp = nil }
    hi.DiffRemoved                        = { guifg = M.colors.red, guibg = M.colors.bottom, gui = nil, guisp = nil }
    hi.DiffSubname                        = { guifg = M.colors.high, guibg = M.colors.bottom, gui = nil, guisp = nil }

    -- Git highlighting
    hi.gitcommitOverflow                  = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.gitcommitSummary                   = { guifg = M.colors.highest, guibg = nil, gui = nil, guisp = nil }
    --hi.gitcommitFirstLine                 = { guifg = nil, guibg = nil, gui = nil, guisp = nil }
    hi.gitcommitComment                   = { guifg = M.colors.low, guibg = nil, gui = nil, guisp = nil }
    hi.gitcommitUntracked                 = { guifg = M.colors.low, guibg = nil, gui = nil, guisp = nil }
    hi.gitcommitDiscarded                 = { guifg = M.colors.low, guibg = nil, gui = nil, guisp = nil }
    hi.gitcommitSelected                  = { guifg = M.colors.low, guibg = nil, gui = nil, guisp = nil }
    hi.gitcommitHeader                    = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.gitcommitSelectedType              = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
    hi.gitcommitUnmergedType              = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.gitcommitDiscardedType             = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.gitcommitBranch                    = { guifg = M.colors.cyan, guibg = nil, gui = nil, guisp = nil }
    hi.gitcommitUntrackedFile             = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
    hi.gitcommitUnmergedFile              = { guifg = M.colors.red, guibg = nil, gui = 'bold', guisp = nil }
    hi.gitcommitDiscardedFile             = { guifg = M.colors.red, guibg = nil, gui = 'bold', guisp = nil }
    hi.gitcommitSelectedFile              = { guifg = M.colors.orange, guibg = nil, gui = nil, guisp = nil }

    -- GitGutter highlighting
    hi.GitGutterAdd                       = { guifg = M.colors.green, guibg = M.colors.lowest, gui = nil, guisp = nil }
    hi.GitGutterChange                    = { guifg = M.colors.blue, guibg = M.colors.lowest, gui = nil, guisp = nil }
    hi.GitGutterDelete                    = { guifg = M.colors.red, guibg = M.colors.lowest, gui = nil, guisp = nil }
    hi.GitGutterChangeDelete              = { guifg = M.colors.purple, guibg = M.colors.lowest, gui = nil, guisp = nil }

    -- Spelling highlighting
    hi.SpellBad                           = { guifg = nil, guibg = M.colors.lowest, gui = 'undercurl', guisp = M.colors.red }
    hi.SpellLocal                         = { guifg = nil, guibg = M.colors.lowest, gui = 'undercurl', guisp = M.colors.cyan }
    hi.SpellCap                           = { guifg = nil, guibg = M.colors.lowest, gui = 'undercurl', guisp = M.colors.blue }
    hi.SpellRare                          = { guifg = nil, guibg = M.colors.lowest, gui = 'undercurl', guisp = M.colors.purple }

    hi.DiagnosticError                    = { guifg = M.colors.red, guibg = nil, gui = 'none', guisp = nil }
    hi.DiagnosticWarn                     = { guifg = M.colors.purple, guibg = nil, gui = 'none', guisp = nil }
    hi.DiagnosticInfo                     = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
    hi.DiagnosticHint                     = { guifg = M.colors.cyan, guibg = nil, gui = 'none', guisp = nil }
    hi.DiagnosticUnderlineError           = { guifg = nil, guibg = nil, gui = 'undercurl', guisp = M.colors.red }
    hi.DiagnosticUnderlineWarning         = { guifg = nil, guibg = nil, gui = 'undercurl', guisp = M.colors.purple }
    hi.DiagnosticUnderlineWarn            = { guifg = nil, guibg = nil, gui = 'undercurl', guisp = M.colors.purple }
    hi.DiagnosticUnderlineInformation     = { guifg = nil, guibg = nil, gui = 'undercurl', guisp = M.colors.brown }
    hi.DiagnosticUnderlineHint            = { guifg = nil, guibg = nil, gui = 'undercurl', guisp = M.colors.cyan }

    hi.LspReferenceText                   = { guifg = nil, guibg = nil, gui = 'underline', guisp = M.colors.high }
    hi.LspReferenceRead                   = { guifg = nil, guibg = nil, gui = 'underline', guisp = M.colors.high }
    hi.LspReferenceWrite                  = { guifg = nil, guibg = nil, gui = 'underline', guisp = M.colors.high }
    hi.LspDiagnosticsDefaultError         = 'DiagnosticError'
    hi.LspDiagnosticsDefaultWarning       = 'DiagnosticWarn'
    hi.LspDiagnosticsDefaultInformation   = 'DiagnosticInfo'
    hi.LspDiagnosticsDefaultHint          = 'DiagnosticHint'
    hi.LspDiagnosticsUnderlineError       = 'DiagnosticUnderlineError'
    hi.LspDiagnosticsUnderlineWarning     = 'DiagnosticUnderlineWarning'
    hi.LspDiagnosticsUnderlineInformation = 'DiagnosticUnderlineInformation'
    hi.LspDiagnosticsUnderlineHint        = 'DiagnosticUnderlineHint'

    -- Shell highlighting
    hi.shShellVariables                   = { guifg = M.colors.purple, guibg = nil, gui = nil, guisp = nil }
    hi.shQuote                            = { guifg = M.colors.orange, guibg = nil, gui = nil, guisp = nil }
    hi.shOption                           = { guifg = nil, guibg = nil, gui = 'bold', guisp = nil }
    hi.shNumber                           = { guifg = M.colors.orange, guibg = nil, gui = nil, guisp = nil }
    hi.shCmdSubRegion                     = { guifg = M.colors.red, guibg = nil, gui = 'bold', guisp = nil }

    -- Fish
    hi.fishCommandSub                     = { guifg = M.colors.cyan, guibg = nil, gui = nil, guisp = nil }
    hi.fishConditional                    = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }

    -- Haskell
    hi.hsImport                           = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.hsPragma                           = { guifg = M.colors.purple, guibg = nil, gui = nil, guisp = nil }
    hi.hsDelimiter                        = { guifg = M.colors.cyan, guibg = nil, gui = nil, guisp = nil }
    hi.hsModule                           = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.hsStructure                        = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    --hi.VarId                              = { guifg = nil, guibg = nil, gui = nil, guisp = nil }
    hi.ConId                              = { guifg = M.colors.green, guibg = nil, gui = nil, guisp = nil }
    -- haskell-vim
    hi.haskellImportKeywords              = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.haskellType                        = { guifg = M.colors.green, guibg = nil, gui = nil, guisp = nil }
    hi.haskellIdentifier                  = { guifg = M.colors.high, guibg = nil, gui = nil, guisp = nil }

    -- VimL highlighting
    hi.vimOption                          = { guifg = M.colors.cyan, guibg = nil, gui = nil, guisp = nil }
    hi.vimVar                             = { guifg = M.colors.green, guibg = nil, gui = nil, guisp = nil }
    hi.vimEnvVar                          = { guifg = M.colors.green, guibg = nil, gui = nil, guisp = nil }
    hi.vimFuncName                        = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.vimFunction                        = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.vimIsCommand                       = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
    hi.vimUserFunc                        = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.vimAutoEvent                       = { guifg = M.colors.green, guibg = nil, gui = nil, guisp = nil }
    hi.vimMapMod                          = { guifg = M.colors.purple, guibg = nil, gui = nil, guisp = nil }
    hi.vimMapModKey                       = { guifg = M.colors.purple, guibg = nil, gui = nil, guisp = nil }
    hi.vimNotation                        = { guifg = M.colors.cyan, guibg = nil, gui = nil, guisp = nil }
    hi.helpNotVi                          = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.helpSectionDelim                   = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.helpSpecial                        = { guifg = M.colors.purple, guibg = nil, gui = nil, guisp = nil }
    hi.helpOption                         = { guifg = M.colors.cyan, guibg = nil, gui = nil, guisp = nil }
    hi.helpHeader                         = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.helpExample                        = { guifg = M.colors.high, guibg = nil, gui = nil, guisp = nil }

    -- NERDTree
    hi.NERDTreeDirSlash                   = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.NERDTreeExecFile                   = { guifg = M.colors.higher, guibg = nil, gui = nil, guisp = nil }
    hi.NERDTreeFile                       = { guifg = M.colors.higher, guibg = nil, gui = nil, guisp = nil }

    -- ALE
    hi.ALEInfoSign                        = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.ALEWarningSign                     = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
    hi.ALEErrorSign                       = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }

    -- netrw
    hi.netrwMarkFile                      = { guifg = M.colors.bottom, guibg = M.colors.green, gui = nil, guisp = nil }
    hi.netrwTreeBar                       = { guifg = M.colors.low, guibg = nil, gui = nil, guisp = nil }

    -- rust
    hi.rustMacro          = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
    hi.rustModPath        = { guifg = M.colors.high, guibg = nil, gui = nil, guisp = nil }
    hi.rustModPathSep     = { guifg = M.colors.high, guibg = nil, gui = nil, guisp = nil }
    hi.rustFuncName       = { guifg = M.colors.orange, guibg = nil, gui = nil, guisp = nil }
    hi.rustFuncCall       = { guifg = M.colors.orange, guibg = nil, gui = nil, guisp = nil }
    hi.rustType           = { guifg = M.colors.brown, guibg = nil, gui = nil, guisp = nil }
    hi.rustKeyword        = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.rustConditional    = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.rustString         = { guifg = M.colors.green, guibg = nil, gui = nil, guisp = nil }
    hi.rustDecNumber      = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.rustFloat          = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.rustEnumVariant    = { guifg = M.colors.cyan, guibg = nil, gui = nil, guisp = nil }
    hi.rustBoolean        = { guifg = M.colors.cyan, guibg = nil, gui = nil, guisp = nil }
    hi.rustIdentifier     = { guifg = M.colors.high, guibg = nil, gui = nil, guisp = nil }
    hi.rustOperator       = { guifg = M.colors.highest, guibg = nil, gui = nil, guisp = nil }
    hi.rustSigil          = { guifg = M.colors.purple, guibg = nil, gui = nil, guisp = nil }
    hi.rustStorage        = { guifg = M.colors.purple, guibg = nil, gui = nil, guisp = nil }
    hi.rustCommentLineDoc = { guifg = M.colors.high, guibg = nil, gui = nil, guisp = nil }

    -- Ruby
    hi.rubyAttribute               = {guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.rubyConstant                = {guifg = M.colors.green, guibg = nil, gui = nil, guisp = nil }
    hi.rubyInterpolation           = {guifg = M.colors.green, guibg = nil, gui = nil, guisp = nil }
    hi.rubyInterpolationDelimiter  = {guifg = M.colors.purple, guibg = nil, gui = nil, guisp = nil }
    hi.rubyRegexp                  = {guifg = M.colors.cyan, guibg = nil, gui = nil, guisp = nil }
    hi.rubySymbol                  = {guifg = M.colors.cyan, guibg = nil, gui = nil, guisp = nil }
    hi.rubyStringDelimiter         = {guifg = M.colors.orange, guibg = nil, gui = nil, guisp = nil }
    hi.rubyClass                   = {guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.rubyDefine                  = {guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.rubyInclude                 = {guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
    hi.rubySharpBang               = {guifg = M.colors.low, guibg = nil, gui = nil, guisp = nil }
    hi.rubyControl                 = {guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.rubyExceptional             = {guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
    hi.rubyFunction                = {guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }

    hi.TSAnnotation                       = { guifg = M.colors.brown, guibg = nil, gui = 'none', guisp = nil }
    hi.TSAttribute                        = { guifg = M.colors.yellow, guibg = nil, gui = 'none', guisp = nil }
    hi.TSBoolean                          = { guifg = M.colors.orange, guibg = nil, gui = 'none', guisp = nil }
    hi.TSCharacter                        = { guifg = M.colors.red, guibg = nil, gui = 'none', guisp = nil }
    hi.TSComment                          = { guifg = M.colors.low, guibg = nil, gui = 'italic', guisp = nil }
    hi.TSConstructor                      = { guifg = M.colors.blue, guibg = nil, gui = 'none', guisp = nil }
    hi.TSConditional                      = { guifg = M.colors.purple, guibg = nil, gui = 'none', guisp = nil }
    hi.TSConstant                         = { guifg = M.colors.orange, guibg = nil, gui = 'none', guisp = nil }
    hi.TSConstBuiltin                     = { guifg = M.colors.orange, guibg = nil, gui = 'italic', guisp = nil }
    hi.TSConstMacro                       = { guifg = M.colors.red, guibg = nil, gui = 'none', guisp = nil }
    hi.TSError                            = { guifg = M.colors.red, guibg = nil, gui = 'none', guisp = nil }
    hi.TSException                        = { guifg = M.colors.red, guibg = nil, gui = 'none', guisp = nil }
    hi.TSField                            = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
    hi.TSFloat                            = { guifg = M.colors.orange, guibg = nil, gui = 'none', guisp = nil }
    hi.TSFunction                         = { guifg = M.colors.blue, guibg = nil, gui = 'none', guisp = nil }
    hi.TSFuncBuiltin                      = { guifg = M.colors.blue, guibg = nil, gui = 'italic', guisp = nil }
    hi.TSFuncMacro                        = { guifg = M.colors.red, guibg = nil, gui = 'none', guisp = nil }
    hi.TSInclude                          = { guifg = M.colors.blue, guibg = nil, gui = 'none', guisp = nil }
    hi.TSKeyword                          = { guifg = M.colors.purple, guibg = nil, gui = 'none', guisp = nil }
    hi.TSKeywordFunction                  = { guifg = M.colors.purple, guibg = nil, gui = 'none', guisp = nil }
    hi.TSKeywordOperator                  = { guifg = M.colors.purple, guibg = nil, gui = 'none', guisp = nil }
    hi.TSLabel                            = { guifg = M.colors.yellow, guibg = nil, gui = 'none', guisp = nil }
    hi.TSMethod                           = { guifg = M.colors.blue, guibg = nil, gui = 'none', guisp = nil }
    hi.TSNamespace                        = { guifg = M.colors.red, guibg = nil, gui = 'none', guisp = nil }
    hi.TSNone                             = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
    hi.TSNumber                           = { guifg = M.colors.orange, guibg = nil, gui = 'none', guisp = nil }
    hi.TSOperator                         = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
    hi.TSParameter                        = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
    hi.TSParameterReference               = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
    hi.TSProperty                         = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
    hi.TSPunctDelimiter                   = { guifg = M.colors.brown, guibg = nil, gui = 'none', guisp = nil }
    hi.TSPunctBracket                     = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
    hi.TSPunctSpecial                     = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
    hi.TSRepeat                           = { guifg = M.colors.purple, guibg = nil, gui = 'none', guisp = nil }
    hi.TSString                           = { guifg = M.colors.green, guibg = nil, gui = 'none', guisp = nil }
    hi.TSStringRegex                      = { guifg = M.colors.cyan, guibg = nil, gui = 'none', guisp = nil }
    hi.TSStringEscape                     = { guifg = M.colors.cyan, guibg = nil, gui = 'none', guisp = nil }
    hi.TSSymbol                           = { guifg = M.colors.green, guibg = nil, gui = 'none', guisp = nil }
    hi.TSTag                              = { guifg = M.colors.yellow, guibg = nil, gui = 'none', guisp = nil }
    hi.TSTagDelimiter                     = { guifg = M.colors.brown, guibg = nil, gui = 'none', guisp = nil }
    hi.TSText                             = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
    hi.TSStrong                           = { guifg = nil, guibg = nil, gui = 'bold', guisp = nil }
    hi.TSEmphasis                         = { guifg = M.colors.orange, guibg = nil, gui = 'italic', guisp = nil }
    hi.TSUnderline                        = { guifg = M.colors.bottom, guibg = nil, gui = 'underline', guisp = nil }
    hi.TSStrike                           = { guifg = M.colors.bottom, guibg = nil, gui = 'strikethrough', guisp = nil }
    hi.TSTitle                            = { guifg = M.colors.blue, guibg = nil, gui = 'none', guisp = nil }
    hi.TSLiteral                          = { guifg = M.colors.orange, guibg = nil, gui = 'none', guisp = nil }
    hi.TSURI                              = { guifg = M.colors.orange, guibg = nil, gui = 'underline', guisp = nil }
    hi.TSType                             = { guifg = M.colors.yellow, guibg = nil, gui = 'none', guisp = nil }
    hi.TSTypeBuiltin                      = { guifg = M.colors.yellow, guibg = nil, gui = 'italic', guisp = nil }
    hi.TSVariable                         = { guifg = M.colors.red, guibg = nil, gui = 'none', guisp = nil }
    hi.TSVariableBuiltin                  = { guifg = M.colors.red, guibg = nil, gui = 'italic', guisp = nil }

    hi.TSDefinition                       = { guifg = nil, guibg = nil, gui = 'underline', guisp = M.colors.high }
    hi.TSDefinitionUsage                  = { guifg = nil, guibg = nil, gui = 'underline', guisp = M.colors.high }
    hi.TSCurrentScope                     = { guifg = nil, guibg = nil, gui = 'bold', guisp = nil }

    hi.LspInlayHint                       = { guifg = M.colors.low, guibg = nil, gui = 'italic', guisp = nil }

    if vim.fn.has('nvim-0.8.0') then
        hi['@comment'] = 'TSComment'
        hi['@error'] = 'TSError'
        hi['@none'] = 'TSNone'
        hi['@preproc'] = 'PreProc'
        hi['@define'] = 'Define'
        hi['@operator'] = 'TSOperator'
        hi['@punctuation.delimiter'] = 'TSPunctDelimiter'
        hi['@punctuation.bracket'] = 'TSPunctBracket'
        hi['@punctuation.special'] = 'TSPunctSpecial'
        hi['@string'] = 'TSString'
        hi['@string.regex'] = 'TSStringRegex'
        hi['@string.escape'] = 'TSStringEscape'
        hi['@string.special'] = 'SpecialChar'
        hi['@character'] = 'TSCharacter'
        hi['@character.special'] = 'SpecialChar'
        hi['@boolean'] = 'TSBoolean'
        hi['@number'] = 'TSNumber'
        hi['@float'] = 'TSFloat'
        hi['@function'] = 'TSFunction'
        hi['@function.call'] = 'TSFunction'
        hi['@function.builtin'] = 'TSFuncBuiltin'
        hi['@function.macro'] = 'TSFuncMacro'
        hi['@method'] = 'TSMethod'
        hi['@method.call'] = 'TSMethod'
        hi['@constructor'] = 'TSConstructor'
        hi['@parameter'] = 'TSParameter'
        hi['@keyword'] = 'TSKeyword'
        hi['@keyword.function'] = 'TSKeywordFunction'
        hi['@keyword.operator'] = 'TSKeywordOperator'
        hi['@keyword.return'] = 'TSKeyword'
        hi['@conditional'] = 'TSConditional'
        hi['@repeat'] = 'TSRepeat'
        hi['@debug'] = 'Debug'
        hi['@label'] = 'TSLabel'
        hi['@include'] = 'TSInclude'
        hi['@exception'] = 'TSException'
        hi['@type'] = 'TSType'
        hi['@type.builtin'] = 'TSTypeBuiltin'
        hi['@type.qualifier'] = 'TSType'
        hi['@type.definition'] = 'TSType'
        hi['@storageclass'] = 'StorageClass'
        hi['@attribute'] = 'TSAttribute'
        hi['@field'] = 'TSField'
        hi['@property'] = 'TSProperty'
        hi['@variable'] = 'TSVariable'
        hi['@variable.builtin'] = 'TSVariableBuiltin'
        hi['@constant'] = 'TSConstant'
        hi['@constant.builtin'] = 'TSConstant'
        hi['@constant.macro'] = 'TSConstant'
        hi['@namespace'] = 'TSNamespace'
        hi['@symbol'] = 'TSSymbol'
        hi['@text'] = 'TSText'
        hi['@text.diff.add'] = 'DiffAdd'
        hi['@text.diff.delete'] = 'DiffDelete'
        hi['@text.strong'] = 'TSStrong'
        hi['@text.emphasis'] = 'TSEmphasis'
        hi['@text.underline'] = 'TSUnderline'
        hi['@text.strike'] = 'TSStrike'
        hi['@text.title'] = 'TSTitle'
        hi['@text.literal'] = 'TSLiteral'
        hi['@text.uri'] = 'TSUri'
        hi['@text.math'] = 'Number'
        hi['@text.environment'] = 'Macro'
        hi['@text.environment.name'] = 'Type'
        hi['@text.reference'] = 'TSParameterReference'
        hi['@text.todo'] = 'Todo'
        hi['@text.note'] = 'Tag'
        hi['@text.warning'] = 'DiagnosticWarn'
        hi['@text.danger'] = 'DiagnosticError'
        hi['@tag'] = 'TSTag'
        hi['@tag.attribute'] = 'TSAttribute'
        hi['@tag.delimiter'] = 'TSTagDelimiter'
    end

    if M.config.ts_rainbow then
        hi.rainbowcol1 = { guifg = M.colors.highest }
        hi.rainbowcol2 = { guifg = M.colors.orange }
        hi.rainbowcol3 = { guifg = M.colors.yellow }
        hi.rainbowcol4 = { guifg = M.colors.top }
        hi.rainbowcol5 = { guifg = M.colors.cyan }
        hi.rainbowcol6 = { guifg = M.colors.blue }
        hi.rainbowcol7 = { guifg = M.colors.purple }
    end

    hi.NvimInternalError = { guifg = M.colors.bottom, guibg = M.colors.red, gui = 'none', guisp = nil }

    hi.NormalFloat       = { guifg = M.colors.higher, guibg = M.colors.bottom, gui = nil, guisp = nil }
    hi.FloatBorder       = { guifg = M.colors.higher, guibg = M.colors.bottom, gui = nil, guisp = nil }
    hi.NormalNC          = { guifg = M.colors.higher, guibg = M.colors.bottom, gui = nil, guisp = nil }
    hi.TermCursor        = { guifg = M.colors.bottom, guibg = M.colors.higher, gui = 'none', guisp = nil }
    hi.TermCursorNC      = { guifg = M.colors.bottom, guibg = M.colors.higher, gui = nil, guisp = nil }

    hi.User1             = { guifg = M.colors.red, guibg = M.colors.lower, gui = 'none', guisp = nil }
    hi.User2             = { guifg = M.colors.purple, guibg = M.colors.lower, gui = 'none', guisp = nil }
    hi.User3             = { guifg = M.colors.higher, guibg = M.colors.lower, gui = 'none', guisp = nil }
    hi.User4             = { guifg = M.colors.cyan, guibg = M.colors.lower, gui = 'none', guisp = nil }
    hi.User5             = { guifg = M.colors.higher, guibg = M.colors.lower, gui = 'none', guisp = nil }
    hi.User6             = { guifg = M.colors.higher, guibg = M.colors.lowest, gui = 'none', guisp = nil }
    hi.User7             = { guifg = M.colors.higher, guibg = M.colors.lower, gui = 'none', guisp = nil }
    hi.User8             = { guifg = M.colors.bottom, guibg = M.colors.lower, gui = 'none', guisp = nil }
    hi.User9             = { guifg = M.colors.bottom, guibg = M.colors.lower, gui = 'none', guisp = nil }

    hi.TreesitterContext = { guifg = nil, guibg = M.colors.lowest, gui = 'italic', guisp = nil }

    if M.config.telescope then
        if not M.config.telescope_borders and hex_re:match_str(M.colors.bottom) and hex_re:match_str(M.colors.lowest) and
            hex_re:match_str(M.colors.lower) then
            local darkerbg           = darken(M.colors.bottom, 0.1)
            local darkercursorline   = darken(M.colors.lowest, 0.1)
            local darkerstatusline   = darken(M.colors.lower, 0.1)
            hi.TelescopeBorder       = { guifg = darkerbg, guibg = darkerbg, gui = nil, guisp = nil }
            hi.TelescopePromptBorder = { guifg = darkerstatusline, guibg = darkerstatusline, gui = nil, guisp = nil }
            hi.TelescopePromptNormal = { guifg = M.colors.higher, guibg = darkerstatusline, gui = nil, guisp = nil }
            hi.TelescopePromptPrefix = { guifg = M.colors.red, guibg = darkerstatusline, gui = nil, guisp = nil }
            hi.TelescopeNormal       = { guifg = nil, guibg = darkerbg, gui = nil, guisp = nil }
            hi.TelescopePreviewTitle = { guifg = darkercursorline, guibg = M.colors.green, gui = nil, guisp = nil }
            hi.TelescopePromptTitle  = { guifg = darkercursorline, guibg = M.colors.red, gui = nil, guisp = nil }
            hi.TelescopeResultsTitle = { guifg = darkerbg, guibg = darkerbg, gui = nil, guisp = nil }
            hi.TelescopeSelection    = { guifg = nil, guibg = darkerstatusline, gui = nil, guisp = nil }
            hi.TelescopePreviewLine  = { guifg = nil, guibg = M.colors.lowest, gui = 'none', guisp = nil }
        else
            hi.TelescopeBorder       = { guifg = M.colors.higher, guibg = M.colors.bottom, gui = nil, guisp = nil }
            hi.TelescopePromptBorder = { guifg = M.colors.higher, guibg = M.colors.bottom, gui = nil, guisp = nil }
            hi.TelescopePromptNormal = { guifg = M.colors.higher, guibg = M.colors.bottom, gui = nil, guisp = nil }
            hi.TelescopePromptPrefix = { guifg = M.colors.higher, guibg = M.colors.bottom, gui = nil, guisp = nil }
            hi.TelescopeNormal       = { guifg = nil, guibg = M.colors.bottom, gui = nil, guisp = nil }
            hi.TelescopePreviewTitle = { guifg = M.colors.lowest, guibg = M.colors.green, gui = nil, guisp = nil }
            hi.TelescopePromptTitle  = { guifg = M.colors.lowest, guibg = M.colors.red, gui = nil, guisp = nil }
            hi.TelescopeResultsTitle = { guifg = M.colors.higher, guibg = M.colors.bottom, gui = nil, guisp = nil }
            hi.TelescopeSelection    = { guifg = nil, guibg = M.colors.lowest, gui = nil, guisp = nil }
            hi.TelescopePreviewLine  = { guifg = nil, guibg = M.colors.lowest, gui = 'none', guisp = nil }
        end
    end

    if M.config.notify then
        hi.NotifyERRORBorder = { guifg = M.colors.red, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyWARNBorder  = { guifg = M.colors.purple, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyINFOBorder  = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyDEBUGBorder = { guifg = M.colors.cyan, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyTRACEBorder = { guifg = M.colors.cyan, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyERRORIcon   = { guifg = M.colors.red, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyWARNIcon    = { guifg = M.colors.purple, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyINFOIcon    = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyDEBUGIcon   = { guifg = M.colors.cyan, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyTRACEIcon   = { guifg = M.colors.cyan, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyERRORTitle  = { guifg = M.colors.red, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyWARNTitle   = { guifg = M.colors.purple, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyINFOTitle   = { guifg = M.colors.higher, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyDEBUGTitle  = { guifg = M.colors.cyan, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyTRACETitle  = { guifg = M.colors.cyan, guibg = nil, gui = 'none', guisp = nil }
        hi.NotifyERRORBody   = 'Normal'
        hi.NotifyWARNBody    = 'Normal'
        hi.NotifyINFOBody    = 'Normal'
        hi.NotifyDEBUGBody   = 'Normal'
        hi.NotifyTRACEBody   = 'Normal'
    end

    if M.config.indentblankline then
        hi.IndentBlanklineChar        = { guifg = M.colors.lower, gui = 'nocombine' }
        hi.IndentBlanklineContextChar = { guifg = M.colors.high, gui = 'nocombine' }
    end

    if M.config.cmp then
        hi.CmpDocumentationBorder   = { guifg = M.colors.higher, guibg = M.colors.bottom, gui = nil, guisp = nil }
        hi.CmpDocumentation         = { guifg = M.colors.higher, guibg = M.colors.bottom, gui = nil, guisp = nil }
        hi.CmpItemAbbr              = { guifg = M.colors.higher, guibg = M.colors.lowest, gui = nil, guisp = nil }
        hi.CmpItemAbbrDeprecated    = { guifg = M.colors.low, guibg = nil, gui = 'strikethrough', guisp = nil }
        hi.CmpItemAbbrMatch         = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemAbbrMatchFuzzy    = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindDefault       = { guifg = M.colors.higher, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemMenu              = { guifg = M.colors.high, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindKeyword       = { guifg = M.colors.purple, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindVariable      = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindConstant      = { guifg = M.colors.orange, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindReference     = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindValue         = { guifg = M.colors.orange, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindFunction      = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindMethod        = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindConstructor   = { guifg = M.colors.blue, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindClass         = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindInterface     = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindStruct        = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindEvent         = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindEnum          = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindUnit          = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindModule        = { guifg = M.colors.higher, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindProperty      = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindField         = { guifg = M.colors.red, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindTypeParameter = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindEnumMember    = { guifg = M.colors.yellow, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindOperator      = { guifg = M.colors.higher, guibg = nil, gui = nil, guisp = nil }
        hi.CmpItemKindSnippet       = { guifg = M.colors.high, guibg = nil, gui = nil, guisp = nil }
    end

    if M.config.illuminate then
        hi.IlluminatedWordText  = { guifg = nil, guibg = nil, gui = 'underline', guisp = M.colors.high }
        hi.IlluminatedWordRead  = { guifg = nil, guibg = nil, gui = 'underline', guisp = M.colors.high }
        hi.IlluminatedWordWrite = { guifg = nil, guibg = nil, gui = 'underline', guisp = M.colors.high }
    end

    if M.config.lsp_semantic then
        hi['@class'] = 'TSType'
        hi['@struct'] = 'TSType'
        hi['@enum'] = 'TSType'
        hi['@enumMember'] = 'Constant'
        hi['@event'] = 'Identifier'
        hi['@interface'] = 'Structure'
        hi['@modifier'] = 'Identifier'
        hi['@regexp'] = 'TSStringRegex'
        hi['@typeParameter'] = 'Type'
        hi['@decorator'] = 'Identifier'

        -- TODO: figure out what these should be
        -- hi['@lsp.type.namespace'] = '@namespace'
        -- hi['@lsp.type.type'] = '@type'
        -- hi['@lsp.type.class'] = '@type'
        -- hi['@lsp.type.enum'] = '@type'
        -- hi['@lsp.type.interface'] = '@type'
        -- hi['@lsp.type.struct'] = '@structure'
        -- hi['@lsp.type.parameter'] = '@parameter'
        -- hi['@lsp.type.variable'] = '@variable'
        -- hi['@lsp.type.property'] = '@property'
        -- hi['@lsp.type.enumMember'] = '@constant'
        -- hi['@lsp.type.function'] = '@function'
        -- hi['@lsp.type.method'] = '@method'
        -- hi['@lsp.type.macro'] = '@macro'
        -- hi['@lsp.type.decorator'] = '@function'
    end

    if M.config.mini_completion then
        hi.MiniCompletionActiveParameter = 'CursorLine'
    end


    vim.g.terminal_color_0  = M.colors.bottom
    vim.g.terminal_color_1  = M.colors.red
    vim.g.terminal_color_2  = M.colors.green
    vim.g.terminal_color_3  = M.colors.yellow
    vim.g.terminal_color_4  = M.colors.blue
    vim.g.terminal_color_5  = M.colors.purple
    vim.g.terminal_color_6  = M.colors.cyan
    vim.g.terminal_color_7  = M.colors.higher
    vim.g.terminal_color_8  = M.colors.low
    vim.g.terminal_color_9  = M.colors.red
    vim.g.terminal_color_10 = M.colors.green
    vim.g.terminal_color_11 = M.colors.yellow
    vim.g.terminal_color_12 = M.colors.blue
    vim.g.terminal_color_13 = M.colors.purple
    vim.g.terminal_color_14 = M.colors.cyan
    vim.g.terminal_color_15 = M.colors.top

    vim.g.base16_gui00      = M.colors.bottom
    vim.g.base16_gui01      = M.colors.lowest
    vim.g.base16_gui02      = M.colors.lower
    vim.g.base16_gui03      = M.colors.low
    vim.g.base16_gui04      = M.colors.high
    vim.g.base16_gui05      = M.colors.higher
    vim.g.base16_gui06      = M.colors.highest
    vim.g.base16_gui07      = M.colors.top
    vim.g.base16_gui08      = M.colors.red
    vim.g.base16_gui09      = M.colors.orange
    vim.g.base16_gui0A      = M.colors.yellow
    vim.g.base16_gui0B      = M.colors.green
    vim.g.base16_gui0C      = M.colors.cyan
    vim.g.base16_gui0D      = M.colors.blue
    vim.g.base16_gui0E      = M.colors.purple
    vim.g.base16_gui0F      = M.colors.brown
end

function M.available_colorschemes()
    return vim.tbl_keys(M.colorschemes)
end

M.colorschemes = {}
setmetatable(M.colorschemes, {
    __index = function(t, key)
        t[key] = require(string.format('colors.%s', key))
        return t[key]
    end,
})

M.colorschemes['dark'] = {
    bottom  = '#1c1c1c',
    lowest  = '#262626',
    lower   = '#303030',
    low     = '#444444',
    high    = '#a8a8a8',
    higher  = '#dadada',
    highest = '#e4e4e4',
    top     = '#f5f5f5',
    red     = '#df5f87',
    orange  = '#d78700',
    yellow  = '#ffd700',
    green   = '#87af5f',
    cyan    = '#00afaf',
    blue    = '#87afff',
    purple  = '#af87ff',
    brown   = '#875f00'
}
M.colorschemes['light'] = {
    bottom  = '#f5f5f5',
    lowest  = '#e4e4e4',
    lower   = '#dadada',
    low     = '#a8a8a8',
    high    = '#444444',
    higher  = '#303030',
    highest = '#262626',
    top     = '#1c1c1c',
    red     = '#df005f',
    orange  = '#df5f00',
    yellow  = '#dfaf00',
    green   = '#5faf5f',
    cyan    = '#00afaf',
    blue    = '#5f87ff',
    purple  = '#af5fff',
    brown   = '#875f00'
}

return M
