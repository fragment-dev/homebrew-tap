require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.1-1-darwin-x64.tar.gz"
    sha256 "ff5157556c8ed970711ea4848a9c4611ad13cb3932842c98f04fbea4398818ff"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.1-1-darwin-arm64.tar.gz"
      sha256 "bd726885704f27cad38581dd52fa91256008bb7339d3adecd23883eab7459f16"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.1-1-linux-x64.tar.gz"
    sha256 "01bda894868693c858a9bb5beb025fb4d40b2171f71309d6d0f6b5d454954d45"
  end
  version "2024.7.1-1"
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
