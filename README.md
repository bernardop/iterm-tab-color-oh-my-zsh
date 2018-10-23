# Oh My Zsh Plugin for Setting iTerm2 Custom Tab Colors

## Installation

```
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/bernardop/iterm-tab-color-oh-my-zsh.git iterm-tab-color
```

Enable it by adding _iterm-tab-color_ to your plugins array in `$HOME/.zshrc`

```
plugins=(git iterm-tab-color)
```

## Usage

After adding it to your plugins and restarting your current terminal you'll have a new alias available `tc`

### Passing separate Red, Green, Blue values

```
tc 255 198 0
```

### Passing a Hex value

```
tc '#0078ae`
```

\- or -

```
tc 0078ae
```