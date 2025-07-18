local M = {}

M.lorem_text =
"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

function M.generate_lorem(words_count)
    -- Split the lorem text into words
    local words = {}
    for word in M.lorem_text:gmatch("%S+") do
        table.insert(words, word)
    end

    -- Limit the words to the requested count
    local result = {}
    for i = 1, math.min(words_count, #words) do
        table.insert(result, words[i])
    end

    return table.concat(result, " ")
end

function M.word_count(str)
    local count = 0
    for _ in str:gmatch("%S+") do
        count = count + 1
    end
    return count
end

return M
