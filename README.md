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

### Explicitely using the command

After adding it to your plugins and restarting your current terminal you'll have a new alias available `tc`

#### Passing separate Red, Green, Blue values

```
tc 255 198 0
```

#### Passing a Hex value

```
tc '#0078ae`
```

\- or -

```
tc 0078ae
```

### Set tab color based on current working directory

You can modify the `.tc-dirs` file located in `~/.oh-my-zsh/custom/plugins/iterm-tab-color` and add `directory=hexValue` pairs to automatically set the color of your tab to `hexValue` when your current working directory matches `directory` (you can use regular expressions)

#### Example `.tc-dirs` file

```
/Users/me/projects/personal*=#065535
/Users/me/projects/work*=#3399ff
```
