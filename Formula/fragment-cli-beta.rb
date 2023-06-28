require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2968.0.0-darwin-x64.tar.gz"
    sha256 "85d025adf7ae61b5d3a4ad24e0e299afa1042b4cf6e9743e849e813656808200"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2968.0.0-darwin-arm64.tar.gz"
      sha256 "3a17852c5f4fc7eea3363b6d95e662e6b78cd3e4b5f7a8d6d6b97725bfe74d8f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2968.0.0-linux-x64.tar.gz"
    sha256 "9cf9cda3a001f5d2bf6bc08e835002a89660bfb0dec90f73137601b4b418d7f7"
  end
  version "2968.0.0"
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
