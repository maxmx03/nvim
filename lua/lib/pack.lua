vim.pack.plugins = function()
  local volt = require 'volt'
  local api = vim.api

  local ns = api.nvim_create_namespace 'PluginManager'
  local buf = api.nvim_create_buf(false, true)

  local close_ui = function()
    if api.nvim_buf_is_valid(buf) then
      api.nvim_buf_delete(buf, { force = true })
    end
  end

  local plugin_state = {
    bufs = {},
  }

  local function get_width(items)
    local max_w = 0
    for _, item in ipairs(items) do
      local w = vim.fn.strwidth(item.name) + vim.fn.strwidth(item.rtxt or '')
      if w > max_w then
        max_w = w
      end
    end
    return max_w + 5
  end

  local function get_plugins()
    local items = {}
    local unix = require 'lib.unix'
    local plugins, err = unix.ls('/site/pack/core/opt', 'data')

    if err ~= nil then
      vim.notify(err, vim.log.levels.ERROR)
      return -- Header
    end
    table.insert(items, {
      name = '  󰋩  Plugin Manager',
      hl = 'Title',
      title = true,
    })

    table.insert(items, { name = 'separator' })

    if #plugins == 0 then
      table.insert(items, {
        name = '  No plugins found',
        hl = 'Comment',
      })
    else
      for _, plugin in ipairs(plugins) do
        table.insert(items, {
          name = '  ' .. plugin,
          rtxt = 'del',
          hl = 'ExLightGrey',
          plugin_name = plugin,
        })
      end
    end

    table.insert(items, { name = 'separator' })

    table.insert(items, {
      name = '  󰅖  Close',
      rtxt = 'q',
      hl = 'ExRed',
    })

    return items
  end

  local items = get_plugins()
  local w = get_width(items)
  local h = #items

  -- Store state
  plugin_state.bufs[buf] = { items = items, w = w }

  local layout = {
    {
      name = 'items',
      lines = function(buf)
        local lines = {}
        local bufv = plugin_state.bufs[buf]
        if not bufv then
          return lines
        end

        for i, item in ipairs(bufv.items or {}) do
          if item.name == 'separator' then
            table.insert(lines, {
              { ' ' .. string.rep('─', bufv.w - 2), 'LineNr' },
            })
          else
            local hover_id = i .. 'plugin' .. buf
            local hovered = vim.g.nvmark_hovered == hover_id
            local hl = hovered and 'ExBlack3Bg' or item.hl

            local actions = {
              hover = { id = hover_id, redraw = 'items' },
              click = function()
                if item.name:match 'Close' then
                  close_ui()
                  return
                end

                local plugin_name = item.plugin_name
                if plugin_name then
                  vim.pack.del({ plugin_name }, { force = true })
                  vim.notify('Deleted: ' .. plugin_name, vim.log.levels.INFO)

                  vim.schedule(function()
                    if api.nvim_buf_is_valid(buf) then
                      plugin_state.bufs[buf].items = get_plugins()
                      volt.redraw(buf, 'items')
                    end
                  end)
                end
              end,
            }

            local name_w = vim.fn.strwidth(item.name)
            local rtxt = item.rtxt or ''
            local rtxt_w = vim.fn.strwidth(rtxt)
            local gap = bufv.w - name_w - rtxt_w - 2

            if item.title then
              local pad = math.floor((bufv.w - name_w) / 2)
              table.insert(lines, {
                { string.rep(' ', pad), hl },
                { item.name, hl, actions },
              })
            else
              table.insert(lines, {
                { item.name, hl, actions },
                { string.rep(' ', gap), hl, actions },
                { rtxt, 'Comment', actions },
              })
            end
          end
        end

        return lines
      end,
    },
  }

  local row = math.floor((vim.o.lines - h) / 2) - 1
  local col = math.floor((vim.o.columns - w) / 2)

  local win = api.nvim_open_win(buf, true, {
    relative = 'cursor',
    width = w,
    height = h,
    border = 'single',
    row = row,
    col = col,
    style = 'minimal',
  })

  vim.wo[win].winhl = 'Normal:ExBlack2Bg,FloatBorder:ExBlack2Border'

  volt.gen_data {
    { buf = buf, ns = ns, layout = layout, xpad = 1 },
  }

  volt.run(buf, { h = h, w = w })
  vim.bo[buf].filetype = 'PluginManager'

  require('volt.events').add(buf)

  -- Simple close handlers
  vim.keymap.set('n', 'q', close_ui, { buffer = buf, silent = true })
  vim.keymap.set('n', '<ESC>', close_ui, { buffer = buf, silent = true })
end
