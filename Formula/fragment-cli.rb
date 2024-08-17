require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.17-darwin-x64.tar.gz"
    sha256 "c07b73c6b75736abdb052e58c455c80c7af482a65513f00650eff958afe57845"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.17-darwin-arm64.tar.gz"
      sha256 "bfb881fe59f9c33b1620a0fe078399ca2c8162a89d6ccb357cbc75e4a6a67d2b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.17-linux-x64.tar.gz"
    sha256 "85f855ccac19f22905343b9ea9e5fb81ecbf6b9f1b88b963af07c31a6338253c"
  end
  version "2024.8.17"
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
