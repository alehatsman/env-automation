[![MIT License][license-image]][license-url]

# Development Environment Automation

My lovely developer environment.

![screenshot](./docs/screenshot.png)

## Installation

```
bash < <(curl -s https://raw.githubusercontent.com/atsman/env-automation/master/init.sh
```

If you install it from scratch, you would need some dependencies to be installed first. Use init.sh or manually install:

1. [Xcode Command Line Tools](http://railsapps.github.io/xcode-command-line-tools.html).
2. [Install Homebrew](http://brew.sh/).
3. Install Git `brew install git`
4. Install Ansible `brew install ansible`

```
make install
```

## Features

* OSX defaults configuration
* Apps installation via brew
* Monokai theme for NVIM, ZSH, Alacrity
* ZSH configuration, aliases, mappings, completion etc.
* VIM configuration, mappings, custom functions etc.
* Alacritty as main terminal app
* Tmux configuration, plugins, keybindings (terminal tabs)

## License

[MIT](LICENSE)

[license-url]: LICENSE

[license-image]: https://img.shields.io/github/license/mashape/apistatus.svg

[capture]: capture.png
