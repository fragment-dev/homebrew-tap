require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5350.0.0-darwin-x64.tar.gz"
    sha256 "f35092814fa123f240deb377f66951d67a850efd79ff982f73b828d34f0b6258"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5350.0.0-darwin-arm64.tar.gz"
      sha256 "5d1c73a023a85a1bb1dfc404503ee7477c6b36e3e93c787b747d6e6cda411ea0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5350.0.0-linux-x64.tar.gz"
    sha256 "0c7d4faaec1ab4f5a75891a59ba0bf73b3851205d83b619a020d39a27860f3a6"
  end
  version "5350.0.0"
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
