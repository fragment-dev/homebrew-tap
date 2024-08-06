require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5479.0.0-darwin-x64.tar.gz"
    sha256 "bcb19ebc2ad4a96ec920b1ffc07ea5178833e582ded8696915155c711f208f4d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5479.0.0-darwin-arm64.tar.gz"
      sha256 "a5b6a9b74fefa3b3921854454d3fd471cf9f403cb4069c78cd5092b7736ea3c6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5479.0.0-linux-x64.tar.gz"
    sha256 "b0c623c15b0b7b6a71bab21e24fbb0467d65f685b140e5080e90752f9c1fc404"
  end
  version "5479.0.0"
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
