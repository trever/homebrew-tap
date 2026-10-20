cask "satellite" do
  version "0.2.0"
  sha256 "9b4ba64eb1e5aa753a9e92e5aba073710b3f576819a52b1a9300c3ab6a811bf0"

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
