require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.2-1-darwin-x64.tar.gz"
    sha256 "f317f8bf14c940f583af8a88755608b2849eb5cbd2781238b03ac8cc949f1bd0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.2-1-darwin-arm64.tar.gz"
      sha256 "bb7723f2eacd518c3d2801935f3fea4ec736e9c01d1a30d719a530958e169f13"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.2-1-linux-x64.tar.gz"
    sha256 "d3a89d84b9508516abe03f4a7bffb42f85b0fb1632f9c7f6510538dcce4fe8e2"
  end
  version "2024.5.2-1"
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
