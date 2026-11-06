cask "satellite" do
  version "0.3.6"
  sha256 "b79701f63e67f94b9627570dfaa3e07447811cf5767c8380e71d316f6ccd453c"

  url "https://updates.trever.com/mac/releases/Satellite-#{version}.dmg"
  name "Satellite"
  desc "Menu bar and notch player for SiriusXM subscribers"
  homepage "https://www.trever.com/siriusxm-for-mac"

  livecheck do
    url "https://updates.trever.com/mac/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Satellite.app"

  uninstall quit: "com.trever.satellite"

  zap trash: [
    "~/Library/Application Support/Satellite",
    "~/Library/Caches/com.trever.satellite",
    "~/Library/HTTPStorages/com.trever.satellite",
    "~/Library/HTTPStorages/com.trever.satellite.binarycookies",
    "~/Library/Preferences/com.trever.satellite.plist",
    "~/Library/WebKit/com.trever.satellite",
  ]
end
