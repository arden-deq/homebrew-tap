cask "dev-dot-good-text-viewer" do
  version "1.2.0"
  sha256 "d7440498d124ec72c31ae2ab861f2b3b64d943f1002112cc3e7fc8e6a0e06954"

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
