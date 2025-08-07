cask "petrichor" do
  version "1.0.0-beta-3"
  sha256 "c6cca44334905042380f52f788aeec6cbcb5f3ada20317bc8bab0c2b9604b446"

  url "https://github.com/kushalpandya/Petrichor/releases/download/v#{version}/Petrichor-#{version}-Universal.dmg"
  name "Petrichor"
  desc "An offline macOS music player"
  homepage "https://github.com/kushalpandya/Petrichor"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)+(?:-alpha-\d+)?)$/i)
  end

  app "Petrichor.app"

  zap trash: [
    "~/Library/Application Support/org.Petrichor",
    "~/Library/Preferences/org.Petrichor.plist",
    "~/Library/Saved Application State/org.Petrichor.savedState",
    "~/Library/Caches/org.Petrichor",
  ]

  caveats <<~EOS
    Petrichor is currently in beta. Expect bugs and breaking changes.
    
    To open for the first time:
    1. Right-click the app and select "Open"
    2. Click "Open" in the dialog
    
    If you see "Petrichor cannot be opened" error:
      xattr -dr com.apple.quarantine /Applications/Petrichor.app
  EOS
end