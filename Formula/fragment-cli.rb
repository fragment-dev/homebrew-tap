require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.13-1-darwin-x64.tar.gz"
    sha256 "6b210a2cf136e3a88042de9dabcec839e488d24c1312895c39963f0b7384c805"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.13-1-darwin-arm64.tar.gz"
      sha256 "85e6186d42c4049cdd36fd827b563c4018d95d42f33878e313d1675ee1d55a57"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.13-1-linux-x64.tar.gz"
    sha256 "d7397a239cb04b3ede4c89e8638cbc55d9154979fd76dbe80524dff2a1d51c8c"
  end
  version "2023.4.13-1"
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
