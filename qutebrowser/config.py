# @Mikhail: 'c' dictionary is an alias for 'config'
# @Documentation (open inside quitebrowser):
#   qute://help/curing.html
#   qute://help/settings.html

c.set("colors.webpage.darkmode.enabled", True)
c.auto_save.session = true
c.fonts.default_size = '14pt'
c.fonts.default_family = 'FiraCode Nerd Font Mono'
# (!) Doesn't work as expected
config.statusbar.posititon = top
"""
When to show the tab bar.
Valid values: (always, never, multiple, switching)
"""
c.tabs.show = 'multiple'
c.url.default_page = 'https://github.com/MikhailKuzntsov1'
c.url.start_pages = 'https://github.com/MikhailKuzntsov1'
c.downloads.location.directory = '~/Downloads'


"""
Interaction with youtube
"""
c.bind('M', 'hint links spawn mpv {hint-url}')
c.bind('m', 'spawn mpv {url}')
c.bind('Z', 'hint links spawn st -e yt-dlp {hint-url}')
c.bind('t', 'set-cmd-text -s :open -t')


"""
Tabs
"""
c.tabs.width('10%')
c.tabs.padding({
    top: '10px' # TODO: do this
})
# TODO: make only selected tabs have bold font
# c.fonts.tabs.selected()
# c.fonts.tabs.unselected()

c.unbind('J', 'normal')
c.unbind('K', 'normal')
c.bind('J', 'tab-prev')
c.bind('K', 'tab-next')

c.bind('<Space>p', 'tab-pin')
c.bind('<Space>h', 'home')

"""
Uncomment this to still load settings cured via autoconfig.yml
Or uncomment this line to load settings from c.py
"""
c.load_autoconfig(False)

"""
Aliases for commands. The keys of the given dictionary are the
aliases, while the values are the commands they map to.
"""
c.aliases = {
    'q': 'quit', 
    'w': 'session-save', 
    'wq': 'quit --save'
}
"""
Allow websites to show notifications.
Type: BoolAsk (true / false / ask)
"""
c.set('content.notifications.enabled', false, 'https://www.reddit.com')
c.set('content.notifications.enabled', True, 'https://www.youtube.com')


"""
Load images automatically in web pages.
Type: Bool
"""
c.set('content.images', True, 'chrome-devtools://*')
c.set('content.images', True, 'devtools://*')

"""
Enable JavaScript.
Type: Bool
"""
c.set('content.javascript.enabled', True, 'chrome-devtools://*')
c.set('content.javascript.enabled', True, 'devtools://*')
c.set('content.javascript.enabled', True, 'chrome://*/*')
c.set('content.javascript.enabled', True, 'qute://*/*')
# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
c.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
c.set('content.cookies.accept', 'all', 'devtools://*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
c.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
c.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
c.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
c.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://docs.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
c.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://drive.google.com/*')


# Search engines which can be used via the address bar.  Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` braces.  The following further
# placeholds are defined to cure how special characters in the
# search terms are replaced by safe characters (called 'quoting'):  *
# `{}` and `{semiquoted}` quote everything except slashes; this is the
# most   sensible choice for almost all search engines (for the search
# term   `slash/and&amp` this placeholder expands to `slash/and%26amp`).
# * `{quoted}` quotes all characters (for `slash/and&amp` this
# placeholder   expands to `slash%2Fand%26amp`). * `{unquoted}` quotes
# nothing (for `slash/and&amp` this placeholder   expands to
# `slash/and&amp`).  The search engine named `DEFAULT` is used when
# `url.auto_search` is turned on and something else than a URL was
# entered to be opened. Other search engines can be used by prepending
# the search engine name to the search term, e.g. `:open google
# qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'am': 'https://www.amazon.com/s?k={}', 'aw': 'https://wiki.archlinux.org/?search={}', 'goog': 'https://www.google.com/search?q={}', 'hoog': 'https://hoogle.haskell.org/?hoogle={}', 're': 'https://www.reddit.com/r/{}', 'ub': 'https://www.urbandictionary.com/define.php?term={}', 'wiki': 'https://en.wikipedia.org/wiki/{}', 'yt': 'https://www.youtube.com/results?search_query={}'}

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = ['#9cc4ff', 'white', 'white']

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#1c1f24'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#232429'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = '#e1acff'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #000000, stop:1 #232429)'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = '#3f4147'

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = '#3f4147'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = '#282c34'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#ecbe7b'

# Foreground color of the matched text in the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.match.fg = '#c678dd'

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = '#c678dd'

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = 'white'

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = '#282c34'

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = '#ff6c6b'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = '#282c34'

# Font color for the matched part of hints.
# Type: QtColor
c.colors.hints.match.fg = '#98be65'

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = '#282c34'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#282c34'

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = 'white'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#497920'

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = '#34426f'

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = '#282c34'

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = 'yellow'

# Background color of the tab bar.
# Type: QssColor
c.colors.tabs.bar.bg = '#1c1f34'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#282c34'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#282c34'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#282c34'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#282c34'

# Background color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.bg = 'seagreen'

# Background color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.bg = 'darkseagreen'

# Background color of pinned selected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.odd.bg = '#282c34'

# Background color of pinned selected even tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.even.bg = '#282c34'

# Default font families to use. Whenever "default_family" is used in a
# font setting, it's replaced with the fonts listed here. If set to an
# empty value, a system-specific monospace default is used.
# Type: List of Font, or Font
c.fonts.default_family = '"FiraCode Nerd Font Mono"'

# Default font size to use. Whenever "default_size" is used in a font
# setting, it's replaced with the size listed here. Valid values are
# either a float value with a "pt" suffix, or an integer value with a
# "px" suffix.
# Type: String
c.fonts.default_size = '11pt'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '11pt "FiraCode Nerd Font Mono"'

# Font used for the debugging console.
# Type: Font
c.fonts.debug_console = '11pt "FiraCode Nerd Font Mono"'

# Font used for prompts.
# Type: Font
c.fonts.prompts = 'default_size sans-serif'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '11pt "FiraCode Nerd Font Mono"'

# Bindings to use dmenu rather than qutebrowser's builtin search.
#c.bind('o', 'spawn --userscript dmenu-open')
#c.bind('O', 'spawn --userscript dmenu-open --tab')


# Bindings for cycling through CSS stylesheets from Solarized Everything CSS:
# https://github.com/alphapapa/solarized-everything-css
c.bind(',ap', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/apprentice/apprentice-all-sites.css ""')
c.bind(',dr', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/darculized/darculized-all-sites.css ""')
c.bind(',gr', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css ""')
c.bind(',sd', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/solarized-dark/solarized-dark-all-sites.css ""')
c.bind(',sl', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/solarized-light/solarized-light-all-sites.css ""')
