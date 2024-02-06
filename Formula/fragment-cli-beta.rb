require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4507.0.0-darwin-x64.tar.gz"
    sha256 "1591102abdd6d76984b2c6ff8deccc928a0c5e7b6359371e52348b8d5bba1e42"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4507.0.0-darwin-arm64.tar.gz"
      sha256 "08b920572fb4ec1bc72a339c306b5b34577c6cf2167c2bbbd05e06b063b21604"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4507.0.0-linux-x64.tar.gz"
    sha256 "d40153ceca1795fe78c4764c7f46a0196eca36d158177c287164f79a677019ca"
  end
  version "4507.0.0"
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
