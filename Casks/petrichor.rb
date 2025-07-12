cask "petrichor" do
  version "1.0.0-alpha-4"
  sha256 "b6ca0981204a1002816a98073aebdeac144dd51abcc6360bea3f2328c777ca04"

  url "https://github.com/kushalpandya/Petrichor/releases/download/v#{version}/Petrichor-#{version}-Universal.dmg"
  name "Petrichor"
  desc "Native macOS music player with folder-based library management"
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
    Petrichor is currently in alpha. Expect bugs and breaking changes.
    
    #{token} is not signed with an Apple Developer certificate.
    
    To open for the first time:
    1. Right-click the app and select "Open"
    2. Click "Open" in the dialog
    
    If you see "Petrichor cannot be opened" error:
      xattr -dr com.apple.quarantine /Applications/Petrichor.app
  EOS
end