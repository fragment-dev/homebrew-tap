require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.1-1-darwin-x64.tar.gz"
    sha256 "8b9291ad4535f7115c466fe29eeb73ef52a470aeda8ed8cd726310b43aeff4b1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.1-1-darwin-arm64.tar.gz"
      sha256 "41f9910fa477e4fd06193b973ae38be674197b61fef63c0a1591cb7f2050f868"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.1-1-linux-x64.tar.gz"
    sha256 "5170bd0a9932ed90832e57f1d9cf7f94744c876e5e886dbfc49dfb23ced187e1"
  end
  version "2023.6.1-1"
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
