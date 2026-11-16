cask "dev-dot-good-text-viewer" do
  version "1.0.1"
  sha256 "732c76a1db206f2cdb38226db5e364470cadb597eec8a7109f7546b628a4ffed"

  url "https://github.com/arden-deq/Good-Text-Viewer/releases/download/v#{version}/Good-Text-Viewer-#{version}-macOS-universal.zip"
  name "Good Text Viewer"
  desc "Fast TXT reader with single- and two-page layouts"
  homepage "https://github.com/arden-deq/Good-Text-Viewer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Good Text Viewer.app"

  zap trash: "~/Library/Preferences/com.devdot.goodtextviewer.plist"
end
