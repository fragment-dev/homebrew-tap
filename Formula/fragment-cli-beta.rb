require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3160.0.0-darwin-x64.tar.gz"
    sha256 "6f666d5e1bf7d6756632f24a3302c6f3ca849bf68ccde6d390693551996c0d61"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3160.0.0-darwin-arm64.tar.gz"
      sha256 "68096795ef100bcc8b251c5c57e746401803150eb165358a4b187f5f07851ec9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3160.0.0-linux-x64.tar.gz"
    sha256 "7c81ae750d6797c344e1ec79ea4563d1e4a90d5db455a65d6845719d6759b7a1"
  end
  version "3160.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
