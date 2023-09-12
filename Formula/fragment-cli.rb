require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.12-3-darwin-x64.tar.gz"
    sha256 "0d4642d3328ea5639e843009cdb2562a9de5bb1595ce0601ce676f2ef9a679a1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.12-3-darwin-arm64.tar.gz"
      sha256 "40e3f60609dc2730bd6f99ca51ff815bd840832cba4b1ef6d4eebb90e5ae9a4d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.12-3-linux-x64.tar.gz"
    sha256 "80842b95f5482b65502d32532d5e8d6d84f10e081a841c9a2f6a9d2a4a699598"
  end
  version "2023.9.12-3"
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
