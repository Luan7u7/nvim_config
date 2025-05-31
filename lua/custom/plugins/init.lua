local function get_plugin_files()
  local plugins = {}
  local path = 'lua/custom/plugins/'

  -- Verifica se o diretório existe
  local handle, err = vim.loop.fs_scandir(path)
  if not handle then
    vim.notify('Failed to scan plugin directory: ' .. (err or 'unknown error'), vim.log.levels.WARN)
    return plugins
  end

  while true do
    local name, type = vim.loop.fs_scandir_next(handle)
    if not name then
      break
    end

    -- Filtra apenas arquivos .lua, ignorando init.lua e diretórios
    if type == 'file' and name:match '%.lua$' and name ~= 'init.lua' then
      table.insert(plugins, name:gsub('%.lua$', ''))
    end
  end

  return plugins
end

-- Carrega todos os plugins de forma segura
local function load_plugins()
  local M = {}
  local plugin_files = get_plugin_files()

  for _, plugin_name in ipairs(plugin_files) do
    local module_path = 'custom.plugins.' .. plugin_name
    local ok, plugin = pcall(require, module_path)

    if ok and type(plugin) == 'table' then
      for k, v in pairs(plugin) do
        M[k] = v
      end
    else
      vim.notify('Failed to load plugin: ' .. module_path, vim.log.levels.WARN)
    end
  end

  return M
end

return load_plugins()
