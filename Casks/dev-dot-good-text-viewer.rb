cask "dev-dot-good-text-viewer" do
  version "1.1.1"
  sha256 "95dfb91624968d94cddcd7961795c1b03b6993a12543ab836fe0cef7eebfa907"

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
