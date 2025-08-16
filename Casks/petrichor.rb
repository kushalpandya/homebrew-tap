cask "petrichor" do
  version "1.0.0-beta-4"
  sha256 "c6e095ee30ffaf8969343f0387046b68f127d042e032ab414407d6fb7104c7d3"

  url "https://github.com/kushalpandya/Petrichor/releases/download/v#{version}/Petrichor-#{version}-Universal.dmg"
  name "Petrichor"
  desc "An offline macOS music player"
  homepage "https://github.com/kushalpandya/Petrichor"
  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)+(?:-beta-\d+)?)$/i)
  end

  app "Petrichor.app"

  zap trash: [
    "~/Library/Containers/org.Petrichor",
    "~/Library/Preferences/org.Petrichor.plist",
    "~/Library/Saved Application State/org.Petrichor.savedState",
  ]

  caveats <<~EOS
    Petrichor is currently in beta. Expect bugs and breaking changes.
    
    To open for the first time:
    1. Right-click the app and select "Open"
    2. Click "Open" in the dialog
  EOS
end