# Homebrew Tap

This tap provides Homebrew formulae for my software projects as available
on my [GitHub profile](https://github.com/kushalpandya).

## Adding the tap

```bash
brew tap kushalpandya/tap
```

## Available Casks

### [Petrichor](https://github.com/kushalpandya/Petrichor)

An offline macOS music player

- **Version**: 1.0.0
- **Status**: Stable

#### Installation

```bash
brew install --cask petrichor
```

#### Updating

To update apps installed from this tap:

```bash
brew update
brew upgrade --cask petrichor
```

#### Uninstalling

To remove Petrichor:

```bash
# Just remove the app
brew uninstall --cask petrichor

# Remove app and all its data
brew uninstall --cask --zap petrichor
```

## License

All software in this tap is subject to their individual licenses.
See each project's repository for license information.
