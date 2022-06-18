-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/christopheryoun/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/christopheryoun/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/christopheryoun/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/christopheryoun/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/christopheryoun/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/christopheryoun/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["nvim-base16.lua"] = {
    config = { "\27LJ\2\n∏\2\0\0\5\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0=\2\3\1\18\1\0\0009\3\2\0009\3\3\3+\4\2\0B\1\3\1K\0\1\0\1\0\16\vbase09\vd19a66\vbase00\v1e222a\vbase08\ve06c75\vbase0A\ve5c07b\vbase07\vc8ccd4\vbase0B\v98c379\vbase06\vb6bdca\vbase0C\v56b6c2\vbase05\vabb2bf\vbase0D\v61afef\vbase04\v565c64\vbase0E\vc678dd\vbase03\v545862\vbase0F\vbe5046\vbase02\v3e4451\vbase01\v1e222a\fonedark\vthemes\vbase16\frequire\0" },
    loaded = true,
    path = "/Users/christopheryoun/.local/share/nvim/site/pack/packer/start/nvim-base16.lua",
    url = "https://github.com/norcalli/nvim-base16.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n≈\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\fautotag\1\0\1\venable\2\14highlight\1\0\2\21use_languagetree\2\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/christopheryoun/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/christopheryoun/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-base16.lua
time([[Config for nvim-base16.lua]], true)
try_loadstring("\27LJ\2\n∏\2\0\0\5\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0=\2\3\1\18\1\0\0009\3\2\0009\3\3\3+\4\2\0B\1\3\1K\0\1\0\1\0\16\vbase09\vd19a66\vbase00\v1e222a\vbase08\ve06c75\vbase0A\ve5c07b\vbase07\vc8ccd4\vbase0B\v98c379\vbase06\vb6bdca\vbase0C\v56b6c2\vbase05\vabb2bf\vbase0D\v61afef\vbase04\v565c64\vbase0E\vc678dd\vbase03\v545862\vbase0F\vbe5046\vbase02\v3e4451\vbase01\v1e222a\fonedark\vthemes\vbase16\frequire\0", "config", "nvim-base16.lua")
time([[Config for nvim-base16.lua]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
