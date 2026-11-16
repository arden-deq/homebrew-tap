cask "dev-dot-good-text-viewer" do
  version "1.0.0"
  sha256 "eed21ebbdebd1effcf0e03f5a0506086337f9883b020ea9f166f8a74386323bb"

  url "https://github.com/arden-deq/Good-Text-Viewer/releases/download/v#{version}/Good-Text-Viewer-#{version}-macOS-universal.zip"
  name "Good Text Viewer"
  desc "Fast TXT reader with single- and two-page layouts"
  homepage "https://github.com/arden-deq/Good-Text-Viewer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Good Text Viewer.app"

  zap trash: "~/Library/Preferences/com.devdot.goodtextviewer.plist"
end
