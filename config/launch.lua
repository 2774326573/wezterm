local wezterm = require('wezterm')
local platform = require('utils.platform')

local function detect_wsl_prog()
   if not platform.is_win then
      return nil
   end

   local distribution = os.getenv('WEZTERM_WSL_DISTRO')
   if not distribution or #distribution == 0 then
      local ok, domains = pcall(wezterm.default_wsl_domains)
      if ok and domains then
         for _, domain in ipairs(domains) do
            if domain.distribution and #domain.distribution > 0 then
               distribution = domain.distribution
               break
            end
         end
      end
   end

   if not distribution then
      return nil
   end

   return {
      'wsl.exe',
      '-d',
      distribution,
      '--cd',
      '~',
   }, distribution
end

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   local wsl_prog, wsl_distribution = detect_wsl_prog()
   local home_dir = (wezterm.home_dir or os.getenv('USERPROFILE') or 'C:\\Users\\Public')
   local git_bash = string.format('%s\\scoop\\apps\\git\\current\\bin\\bash.exe', home_dir)

   options.default_prog = wsl_prog or { 'pwsh', '-NoLogo' }

   local function add_menu(entry)
      table.insert(options.launch_menu, entry)
   end

   if wsl_prog then
      add_menu({ label = string.format('WSL (%s)', wsl_distribution), args = wsl_prog })
   end

   add_menu({ label = 'PowerShell Core', args = { 'pwsh', '-NoLogo' } })
   add_menu({ label = 'PowerShell Desktop', args = { 'powershell' } })
   add_menu({ label = 'Command Prompt', args = { 'cmd' } })
   add_menu({ label = 'Nushell', args = { 'nu' } })
   add_menu({ label = 'Msys2', args = { 'ucrt64.cmd' } })
   add_menu({ label = 'Git Bash', args = { git_bash } })
elseif platform.is_mac then
   options.default_prog = { '/opt/homebrew/bin/fish', '-l' }
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { '/opt/homebrew/bin/fish', '-l' } },
      { label = 'Nushell', args = { '/opt/homebrew/bin/nu', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
   }
elseif platform.is_linux then
   options.default_prog = { 'fish', '-l' }
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { 'fish', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
   }
end

return options
