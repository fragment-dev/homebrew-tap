require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.7-1-darwin-x64.tar.gz"
    sha256 "7d1e79c100bcf5a49b849d9127f5a3c1e8734ef99ce8259652d37ca2b039afd9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.7-1-darwin-arm64.tar.gz"
      sha256 "61d425f820b7d45a311f97de1992a25a4b960e209386df2c1e6f5534d6047598"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.7-1-linux-x64.tar.gz"
    sha256 "0be42d2d515169be2191a0a3b15178e2bd062e0f676d754490e628e37ef1bf2a"
  end
  version "2024.11.7-1"
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
