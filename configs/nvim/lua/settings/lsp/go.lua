local status_ok, go_helpers = pcall(require, "gopher")
if not status_ok then
    return
end

go_helpers.setup {
    commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "gotests",
        impl = "impl",
        iferr = "iferr",
    },
}
