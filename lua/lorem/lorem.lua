local M = {}

local function load_word_bank(cache_root, subdir, filename, safe)
    local path = vim.fs.joinpath(cache_root, subdir)
    local file_path = vim.fs.joinpath(path, filename)

    if safe or false then
        return {
            "lorem", "ipsum", "dolor", "sit", "amet",
            "consectetur", "adipiscing", "elit",
            "eiusmod", "tempor", "incididunt", "ut", "labore",
            "et", "dolore", "magna", "aliqua"
        }
    end
    if vim.fn.isdirectory(path) == 1 and vim.fn.filereadable(file_path) == 1 then
        local lines = {}
        for line in io.lines(file_path) do
            table.insert(lines, line)
        end
        return lines
    end
end


function M.generate_lorem(count, safe)
    local word_bank = load_word_bank(vim.fs.joinpath(vim.fn.stdpath("cache")), "dictionary", "words.txt", safe)
    local result = {}
    for i = 1, count do
        local index = math.random(#word_bank)
        table.insert(result, word_bank[index])
    end
    result[1] = result[1]:gsub("^%l", string.upper)
    return table.concat(result, " ") .. "."
end

return M
