local setup, markdown = pcall(require, "markdown")
if not setup then
    print("Failed to load markdown module: " .. markdown)
    return
end

markdown.setup()
