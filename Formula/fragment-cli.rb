require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.25-darwin-x64.tar.gz"
    sha256 "7a8a14362d4627e78e45c95d6cc32a30a83e4ed41415a6c2e1d4a75dd9d6961f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.25-darwin-arm64.tar.gz"
      sha256 "58f6a9860ac9f1d972dcc18fcfcd7ee08768fc9894b0cd23ebc8b167afae1306"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.25-linux-x64.tar.gz"
    sha256 "d2a0cf768e37a255e560da360fca888b1f1688d241be7c12d49bc903033f42c5"
  end
  version "2024.3.25"
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
