require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2416.0.0-darwin-x64.tar.gz"
    sha256 "a85e1a5cd93a8d86f81560134bb0d003de955fc05fa960fa34cf7a9c299f1725"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2416.0.0-darwin-arm64.tar.gz"
      sha256 "b9db0dcffcb94800ee0e135752a88713179685419b595a91219edd8385fe5b16"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2416.0.0-linux-x64.tar.gz"
    sha256 "b4e97fb6d7d56a78b7ecabdbb8e3cc111c8a72d431de10b735d99b212c3eb9ea"
  end
  version "2416.0.0"
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
