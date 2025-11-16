cask "petrichor" do
  version "1.2.0"
  sha256 "802d4fa77794072ffacfcc4c8391821f6bb25f363f9a72d9b15805f868b424c4"

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