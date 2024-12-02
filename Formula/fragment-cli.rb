require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.2-darwin-x64.tar.gz"
    sha256 "3e50fd1cf30aadb13f2481aa61b5e6fbfc01e44b26ad34e09495b1fdbb64b055"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.2-darwin-arm64.tar.gz"
      sha256 "bf119b718444a6e9c8f296ac4c28170dcd1563fc59b6c8e9a4b3c4f95e1b672c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.2-linux-x64.tar.gz"
    sha256 "478b13f296ac6812243e2f968d5b956216f297aeb429aec28e7fdb2e628d76ff"
  end
  version "2024.12.2"
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
