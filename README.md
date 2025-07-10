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

- **Version**: 1.0.0-alpha-3
- **Status**: Alpha

#### Installation

```bash
brew install --cask petrichor
```

Since Petrichor isn't notarized, macOS Gatekeeper may block it. Here's how to open it:

1. Right-click the app and select "Open"
2. **If that fails**, run this command in Terminal:
   ```bash
   xattr -dr com.apple.quarantine /Applications/Petrichor.app
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

## Troubleshooting

If you encounter the "app is damaged" error with any of the installed apps,
it's because the app isn't notarized. Right-click the app and select "Open"
to bypass Gatekeeper.

## License

All software in this tap is subject to their individual licenses.
See each project's repository for license information.
