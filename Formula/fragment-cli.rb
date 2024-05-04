require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.3-darwin-x64.tar.gz"
    sha256 "17974d89c66b87eb7e59c58f5e019a40f443f4e7012c740bdf8a60131114b140"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.3-darwin-arm64.tar.gz"
      sha256 "121237382c7bbaca6b1b5402c56627b553c285c419887041a4b564a099e89361"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.3-linux-x64.tar.gz"
    sha256 "a997e933ce0aef2d5a866cbc246cd8842de1b5c49e1c666648e5a9a1fb847c22"
  end
  version "2024.5.3"
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
