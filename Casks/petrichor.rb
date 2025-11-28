cask "petrichor" do
  version "1.2.3"
  sha256 "6bb284d090454671b543aa36d2184f2ce73667b61f996e96cc2367b9b511dcee"

  url "https://github.com/kushalpandya/Petrichor/releases/download/v#{version}/Petrichor-#{version}-Universal.dmg"
  name "Petrichor"
  desc "An offline macOS music player"
  homepage "https://github.com/kushalpandya/Petrichor"
  auto_updates true

  depends_on macos: ">= :sonoma"

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
    To open for the first time:
    1. Right-click the app and select "Open"
    2. Click "Open" in the dialog
  EOS
end