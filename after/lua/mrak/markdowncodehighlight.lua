local M = {}

function M.fn()
  local marker_start = 'ORIGINAL MARKDOWN CODE BLOCK BEGIN'
  local marker_middle = 'GENERATED MARKDOWN CODE BLOCK BEGIN'
  local marker_end = 'GENERATED MARKDOWN CODE BLOCK END'

  local function generate()
    local begin_fence = vim.fn.search('\\m *```', 'bnW')
    if begin_fence == 0 then
      return
    end
    local end_fence = vim.fn.search('\\m *```', 'nW')
    local begin_code = begin_fence + 1
    local end_code = end_fence - 1

    local html = require('tohtml').tohtml(nil, {range = {begin_code,end_code}})
    local trimmed = {}

    local in_block = false
    for _, l in pairs(html) do
      if in_block then
        table.insert(trimmed, l)
        if string.match(l, "^</pre>") then
          break
        end
      else
        if string.match(l, "^<pre>") then
          in_block = true
          table.insert(trimmed, l)
        end
      end
    end

    vim.fn.append(end_fence, '<!-- '..marker_end..' -->')
    vim.fn.append(end_fence, trimmed)
    vim.fn.append(end_fence, '---- '..marker_middle..' --->')
    vim.fn.append(begin_fence - 1, '<!--- '..marker_start)
  end

  local function in_generated_section()
    local b = vim.fn.search(marker_start, 'bnW')
    if b == 0 then
      return false
    end
    local e = vim.fn.search(marker_end, 'bnW')
    if e > b then
      return false
    end

    return true
  end

  local function ungenerate()
    local b = vim.fn.search(marker_start, 'bW')
    vim.fn.deletebufline(vim.fn.bufname(), b)
    local m = vim.fn.search(marker_middle, 'W')
    local e = vim.fn.search(marker_end, 'W')
    vim.fn.deletebufline(vim.fn.bufname(), m,e)
    vim.fn.cursor(b+1, 0)
  end

  if in_generated_section() then
    ungenerate()
  else
    generate()
  end
end

return M
