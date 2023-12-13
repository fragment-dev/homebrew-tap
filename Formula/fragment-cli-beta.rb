require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4151.0.0-darwin-x64.tar.gz"
    sha256 "5064e2c13d766d5b7b84b2d2e1b66e5ed3ce048f55d4655a4c5ca829fb689412"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4151.0.0-darwin-arm64.tar.gz"
      sha256 "818811434e7ddd5875bd0cdc4cb3abea85245825e52fc8ed1cbe02f1222deadf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4151.0.0-linux-x64.tar.gz"
    sha256 "d4b667e9278b17e4ea64be802d5b30fca3afe4e35be643b2970b12166fff3cf7"
  end
  version "4151.0.0"
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
