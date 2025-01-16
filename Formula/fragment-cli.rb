require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.16-2-darwin-x64.tar.gz"
    sha256 "5883e9e8b90a3e9a32d38c41c50bda443705cd3935038435a716e67663326659"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.16-2-darwin-arm64.tar.gz"
      sha256 "49f6a10323345745de52e91f54bcd762320c5bcfe5eff673ea23a729ed4ec0f7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.16-2-linux-x64.tar.gz"
    sha256 "9164496f6ee66c628deb97b94e3178b46a789e856da4ed7bcb277272cc2a9fe5"
  end
  version "2025.1.16-2"
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
