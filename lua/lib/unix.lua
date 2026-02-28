local M = {}

---@param path string
---@param what? 'cache'|'config'|'data'|'log'|'run'|'state'
---@return string[], string?
function M.ls(path, what)
  local files = vim.fn.readdir(vim.fn.stdpath(what or 'config') .. path)
  local file_names = {}
  for _, file in ipairs(files) do
    table.insert(file_names, file)
  end
  if vim.tbl_isempty(file_names) then
    return {}, 'directory is empty'
  end
  return file_names
end

---@param path string
---@return boolean|nil
---@return string|nil
function M.mkdir(path)
  local stat = vim.uv.fs_statfs(path)
  if stat == nil then
    local ok, err = vim.uv.fs_mkdir(path, 493)
    if not ok then
      return false, err
    else
      return true
    end
  end
  return true
end

---@return string
function M.pwd()
  local dir, err, err_name = vim.uv.cwd()
  if err ~= nil or dir == nil or string.len(dir) == 0 then
    if err_name then
      return ''
    end
    return ''
  end
  return dir
end

return M
