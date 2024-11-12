require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.11-darwin-x64.tar.gz"
    sha256 "eb687d480bae8b6d8cddf83b84390eaf4d3b2d53da300f92133614c9a7cff785"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.11-darwin-arm64.tar.gz"
      sha256 "4849aef911eff2e2a9f23f8dc978d61c8cb2bd99a31b9a0853de30feba22aae2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.11-linux-x64.tar.gz"
    sha256 "db0cc6d33bd38f83903a94ce1c482860f6e7b173eb9c6e19943d44d5e2f986e3"
  end
  version "2024.11.11"
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
