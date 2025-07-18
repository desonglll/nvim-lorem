
# nvim-lorem

A simple Neovim plugin to insert lorem to cursor location.

## 📦 Installation (using lazy.nvim)

```lua
{
    "desonglll/nvim-lorem"
    name = "nvim-lorem",
    dependencies = {
        "desonglll/nvim-dictionary"
    },
    cmd = { "Lorem" },
    config = function()
    end,
}
```

## Usage

*Optional* After installed the `nvim-dictionary` plugin, using `:DownloadEnglishWords` to download words.

Using `:Lorem [number of words] ["safe"]`

