require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.26-darwin-x64.tar.gz"
    sha256 "2a1450896e01a622c2a05dcd3e6dcdcbb9b456251dcc7662c151759cddf9c60a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.26-darwin-arm64.tar.gz"
      sha256 "7a2cf32682efa53bf2c8fb995c8cb766c6b04ff08a9cb807b81e1181c1dcd180"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.26-linux-x64.tar.gz"
    sha256 "c72fed832cd6b0bb856c7ae487923521ba9042089d5c36adc3a77705a0d074f6"
  end
  version "2024.3.26"
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
