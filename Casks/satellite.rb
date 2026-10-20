cask "satellite" do
  version "0.2.1"
  sha256 "002c765437a7a8e3bf01178e8a0f73e52cd868de3faef93f068d462dada9417d"

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
