require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.27-darwin-x64.tar.gz"
    sha256 "c0003312a5d357dee1b8c631ff3ede8406e96698ab465ffcbdbbcd2965816f68"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.27-darwin-arm64.tar.gz"
      sha256 "45e13c5e9aef40ee6ab7ab848e76b7550a01b2c11cbcf7a44d33f3db8cb649ce"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.27-linux-x64.tar.gz"
    sha256 "be0544d5802452847c9d062bf6feb1c702e34c1060c821373ddb77d9b00212cf"
  end
  version "2024.6.27"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
