require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4453.0.0-darwin-x64.tar.gz"
    sha256 "e54dcb9c9a3e01ce73e741d956fa65cf43e40240a94dfa58ffcf5543e83ac819"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4453.0.0-darwin-arm64.tar.gz"
      sha256 "44956cc3114110b3c2990014b065eb5766a821fdbef58ae40186e62d80bd8108"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4453.0.0-linux-x64.tar.gz"
    sha256 "ee34d41a5705fc029acdf6cee3bda0b94e7a3e0b991b175c11bba1a5cbc022af"
  end
  version "4453.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
