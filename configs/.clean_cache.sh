
# Asyncronous cleaner script
ccleaner() {
    find ~/ -name ".DS_Store" -print -delete 2>&1 > /dev/null  2>&1 > /dev/null &
    find ~/ -name "**.42_cache_bak**" -print -delete 2>&1 > /dev/null  2>&1 > /dev/null &
    rm -rf ~/.zcompdump*  2>&1 > /dev/null &
    rm -rf .Trash/*  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/  2>&1 > /dev/null &
    rm -rf ~/Library/Caches/*  2>&1 > /dev/null &
    rm -rf ~/Library/42_cache  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Caches/*  2>&1 > /dev/null &
    rm -rf ~/Library/42_cache  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Developer/CoreSimulator/Caches/  2>&1 > /dev/null &
    rm -rf ~/Library/Developer/CoreSimulator/Devices/  2>&1 > /dev/null &
    rm -rf ~/Library/Logs/  2>&1 > /dev/null &
    rm -rf ~/Library/Google/GoogleSoftwareUpdate/  2>&1 > /dev/null &
    rm -rf ~/Library/Containers/com.apple.Safari/Data/Library/Caches/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/CachedData/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/logs  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/zoom.us/AutoUpdater  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Google/Chrome/BrowserMetrics/.  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Google/Chrome/BrowserMetrics-spare.pma  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Google/Chrome/GrShaderCache/GPUCache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Local\ Extension Settings 2>&1 > /dev/null /cjpalhdlnbpafiamejdnhcphjbkeiagm/lost &
    rm -rf ~/Library/Application\ Support/Code/Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/CachedExtensionVSIXs/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/Code\ Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/  2>&1 > /dev/null &
    rm -rf  ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/ScriptCache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Google/Chrome/ShaderCache/GPUCache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/CachedExtensions/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/logs/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/Service\ Worker/CacheStorage/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/Service\ Worker/ScriptCache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage/  2>&1 > /dev/null &
    rm -rf ~/.Trash/  2>&1 > /dev/null &
}
