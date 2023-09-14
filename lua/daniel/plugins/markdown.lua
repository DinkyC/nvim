local setup, markdown = pcall(require, "markdown")
if not setup then
    return
end

markdown.setup()
