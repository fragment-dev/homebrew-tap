require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3109.0.0-darwin-x64.tar.gz"
    sha256 "dc260235ebe7b36ba3308f47bd4c8b5be22805c1bf557844c0c8aa261b8eb32e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3109.0.0-darwin-arm64.tar.gz"
      sha256 "69d67ac4fd1a6d62e5a5f1f2f51b7f74310f7755119cd9c189a5eb1ab89c7387"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3109.0.0-linux-x64.tar.gz"
    sha256 "574e5c5f45c46dafc6deb084cf3a674064eb152e656a256a6818439dc7359719"
  end
  version "3109.0.0"
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
