# Visual Studio Code-like Keybindings for [micro editor](https://github.com/zyedidia/micro)

## What

Based on Windows/Linux shortcuts, e.g. <kbd>ctrl</kbd><kbd>left</kbd> for WordLeft and so on, also sometimes referred to as Common User Access (CUA)

Sets all available micro keybindings to their vscode counterpart default shortcuts, if present.

## Why

With this setup, you can now use a powerful text editor (multi cursor, tabs, macros etc.) with keybindings you are familiar with, not having to learn new syntax.

Maybe consider this README as a basic guide to moving from VSCode to Linux Terminal editor-wise for a more distraction-free and minimalist way of coding. Check out [ei2030's PaperTerm project](https://forum.ei2030.org/t/paperterm-project-definition-and-marketing-materials/146) if you're also interested in the hardware aspect of this.

## How

Put `bindings.json` into the config dir (see [micro keybindings docs](https://github.com/zyedidia/micro/blob/master/runtime/help/keybindings.md)). If you use the <kbd>alt</kbd><kbd>z</kbd> shortcut (toggle softwrap), you also need `init.lua` in this directory.

These bindings are tailored to an English keyboard. Adjustments for other keyboard layouts should be minimal.

### TTY
If you want to use these shortcuts in Linux virtual console (typically tty1-6), you also 
- need `sudo loadkeys /path/to/keymap.map`, for example in your `.bashrc`. This is explained [here](https://github.com/zyedidia/micro/wiki/Linux-Console-Keybindings).
- might need to set micro config `xterm` to `true` if bindings like <kbd>ctrl</kbd><kbd>left</kbd> don't work
- in case you didn't know, you can easily change tty [fonts](https://wiki.archlinux.org/index.php/Linux_console#Fonts) and [colors](http://archive.is/QSYHd) or change the terminal emulator, most commonly to
    - [KMSCON](https://wiki.archlinux.org/index.php/KMSCON) or
    - [fbterm](https://packages.debian.org/sid/utils/fbterm) (for Arch Linux, [this](https://github.com/glitsj16/fbterm-patched)+[this](https://gist.github.com/zellio/5809852) works well)
- micro has a backup mechanic, but no session / restore functionality, it seems. For that, you will need a wrapper, for example tmux with [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect).
- without X11, there is no system clipboard. You need to use micro's internal clipboard. This fails for copying accross multiple opened micro processes. As a workaround, you can set up a clipboard manager yourself: Copy the file `xclip` to `/some/path`, make it executable and inject this fake xclip into the PATH when running micro, for example with an alias in your bashrc: `alias micro='PATH=/some/path:"$PATH" \micro'`

## Omitted keybindings

The following actions are not included in `bindings.json` because they either don't exist in vscode or have no default keybinding there. Some of these are useful though.
- FindLiteral (micro <kbd>ctrl</kbd><kbd>f</kbd> is mapped to regex find)
- HalfPageUp
- HalfPageDown
- ParagraphPrevious
- ParagraphNext
- ToggleHelp
- ToggleDiffGutter
- ToggleRuler
- NextSplit
- Unsplit
- VSplit (micro split works great but you [cannot resize them by keyboad yet](https://github.com/zyedidia/micro/issues/1807), only mouse)
- HSplit
- PreviousSplit
- ToggleMacro
- PlayMacro
- Anything from [plugins](https://raw.githubusercontent.com/micro-editor/plugin-channel/master/channel.json)
