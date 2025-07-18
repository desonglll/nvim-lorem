local M = {}

function M.setup()
    local lorem = require("lorem.lorem")
    vim.api.nvim_create_user_command("Lorem", function(opts)
        local words_count
        if opts.args == "all" then
            words_count = lorem.word_count(lorem.lorem_text)
        else
            words_count = tonumber(opts.args) or 10 -- Default to 10 words if no number is given
        end
        print(string.format("Insert Lorem with %d words.", words_count))

        local lorem_text = lorem.generate_lorem(words_count)

        -- Insert the lorem text at the cursor position
        vim.api.nvim_put({ lorem_text }, "c", true, true)
    end, {
        desc = "Insert Lorem Ipsum text with specified word count",
        nargs = "?" -- Allows the user to provide a number (optional)
    })
end

return M
