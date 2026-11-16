class GoodTextViewer < Formula
  desc "Native macOS TXT reader with single- and two-page layouts"
  homepage "https://github.com/arden-deq/Good-Text-Viewer"
  url "https://github.com/arden-deq/Good-Text-Viewer/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f12b8667dbca812d51d772accd79c3dd34aca58241ebf276ce76824ab6f7c96f"
  head "https://github.com/arden-deq/Good-Text-Viewer.git", branch: "main"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :ventura

  def install
    system "make", "package"
    libexec.install "dist/Good Text Viewer.app"
    (bin/"good-text-viewer").write <<~SH
      #!/bin/sh
      app="#{opt_libexec}/Good Text Viewer.app"
      if [ "$#" -eq 0 ]; then
        exec /usr/bin/open "$app"
      fi
      exec /usr/bin/open -a "$app" -- "$@"
    SH
  end

  test do
    app = libexec/"Good Text Viewer.app"
    assert_match "com.devdot.goodtextviewer",
                 shell_output("/usr/bin/plutil -extract CFBundleIdentifier raw '#{app}/Contents/Info.plist'")
    system "/usr/bin/codesign", "--verify", "--deep", "--strict", app
  end
end
