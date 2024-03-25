require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.22-1-darwin-x64.tar.gz"
    sha256 "401e7aae4c40658f7bc451932e86e3569113816a267e340e0a632d29e0a0e00f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.22-1-darwin-arm64.tar.gz"
      sha256 "39b1758909a93f49e1b96c84e24e201151d89f3cebf6ac0ab4d831256333c758"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.22-1-linux-x64.tar.gz"
    sha256 "c1b025a15dc78d84f83566b0e3cec02a617ae3f2599f2841f3938b0fe755f167"
  end
  version "2024.3.22-1"
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
