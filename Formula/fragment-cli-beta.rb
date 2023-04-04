require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2353.0.0-darwin-x64.tar.gz"
    sha256 "2f2bde246e568bcc78224190ffca6e914b8bdeb9bf55483d62584d47d16fa40f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2353.0.0-darwin-arm64.tar.gz"
      sha256 "354881f1531230fa45d4f768e56f9757e5204dcdc7850405b581384e4d6741f3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2353.0.0-linux-x64.tar.gz"
    sha256 "b5bc90662b232e3b305bac5f64b0ad2fcf5566514759dbb645da2466a8e2a50a"
  end
  version "2353.0.0"
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
