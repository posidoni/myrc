local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

colorizer.setup({
	"css",
	"javascript",
	"html",
	"typescript",
	"typescriptreact",
	"javascriptreact",
}, { mode = "background", css = true })
