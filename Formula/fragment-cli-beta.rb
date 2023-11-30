require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4071.0.0-darwin-x64.tar.gz"
    sha256 "e0278e78e7af5f68eb89361b6fef0f1783e58eab10757451a24a91663c66b863"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4071.0.0-darwin-arm64.tar.gz"
      sha256 "a6e5e7713922098c764c66d70c9f2a72967cfd46ad86d533793a0622be30deee"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4071.0.0-linux-x64.tar.gz"
    sha256 "a909bcdb0a1448efe2680796cb428f7e62b5e2af1337c5bf23693b456c157655"
  end
  version "4071.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
