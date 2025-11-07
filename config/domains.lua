local wezterm = require('wezterm')
local platform = require('utils.platform')

local function detect_wsl_distribution()
   local from_env = os.getenv('WEZTERM_WSL_DISTRO')
   if from_env and #from_env > 0 then
      return from_env
   end

   local ok, domains = pcall(wezterm.default_wsl_domains)
   if not ok or not domains then
      return nil
   end

   for _, domain in ipairs(domains) do
      if domain.distribution and #domain.distribution > 0 then
         return domain.distribution
      end
   end
end

local default_wsl_distribution = detect_wsl_distribution() or 'Ubuntu'

local options = {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   ssh_domains = {},

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   unix_domains = {},

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {},
}

if platform.is_win then
   options.ssh_domains = {
      {
         name = 'ssh:wsl',
         remote_address = 'localhost',
         multiplexing = 'None',
         default_prog = { 'fish', '-l' },
         assume_shell = 'Posix',
      },
   }

   options.wsl_domains = {
      {
         name = 'wsl:ubuntu-fish',
         distribution = default_wsl_distribution,
         default_cwd = '~',
         default_prog = { 'fish', '-l' },
      },
      {
         name = 'wsl:ubuntu-bash',
         distribution = default_wsl_distribution,
         default_cwd = '~',
         default_prog = { 'bash', '-l' },
      },
   }
end

return options
