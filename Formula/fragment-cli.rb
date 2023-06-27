require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.27-darwin-x64.tar.gz"
    sha256 "865fd3febdfc047959a1dd83126728622be984a5cf772a6c00944c6508c6305f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.27-darwin-arm64.tar.gz"
      sha256 "9543b0da995ac880ae326ee0ad0c054f795096c87efd31e21b5acbfb02d57753"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.27-linux-x64.tar.gz"
    sha256 "806372092a0d5a2100a8cad625ee905a60ca82e9b4fc1b014ca6098cc44c8351"
  end
  version "2023.6.27"
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
