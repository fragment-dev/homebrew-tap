require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.17-darwin-x64.tar.gz"
    sha256 "096d24b63086683420a89a53610b14db7f82c9c238b1a6cf75e12b438bfea45e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.17-darwin-arm64.tar.gz"
      sha256 "7b0df62521caa51a440d091b8585a6b4a0235e9846019cfed74f0eb709b2d858"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.17-linux-x64.tar.gz"
    sha256 "a5552fc8b79c2cfa8f7849577aa5c9f3c2c7016aa1ca53c753669d09fc76d7e1"
  end
  version "2023.7.17"
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
