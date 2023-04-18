require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2459.0.0-darwin-x64.tar.gz"
    sha256 "67b0b7f39aeb93d74d87c498445a36e718b08534eaa44912d3e39a91dbf9efb1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2459.0.0-darwin-arm64.tar.gz"
      sha256 "c0e6ec2244bbc9cd56c7c4fa09517f3a03019fc8f04391a4d5d5692904bd6c52"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2459.0.0-linux-x64.tar.gz"
    sha256 "299169e81f454b30c261db3e90ae64c653da1a532dd6a2d54542237831a0e731"
  end
  version "2459.0.0"
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
