local M = {}

local function parse_args(opts)
    local args = vim.split(opts.args or "", " ")
    local count = tonumber(args[1]) or 10
    local is_safe = args[2] == "safe"

    return count, is_safe
end

function M.setup()
    local lorem = require("lorem.lorem")
    vim.api.nvim_create_user_command("Lorem", function(opts)
        local words_count, safe_mode = parse_args(opts)

        words_count = tonumber(words_count) or 10 -- Default to 10 words if no number is given

        print(string.format("Insert Lorem with %d words.", words_count))

        local lorem_text = lorem.generate_lorem(words_count, safe_mode)

        -- Insert the lorem text at the cursor position
        vim.api.nvim_put({ lorem_text }, "c", true, true)
    end, {
        desc = "Insert Lorem Ipsum text with specified word count",
        nargs = "?" -- Allows the user to provide a number (optional)
    })
end

return M
