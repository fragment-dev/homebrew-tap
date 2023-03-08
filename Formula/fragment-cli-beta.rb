require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2148.0.0-darwin-x64.tar.gz"
    sha256 "f2ec7e80ad699129572f029872593c195fc5a1190ce1d82cf342c32db9971871"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2148.0.0-darwin-arm64.tar.gz"
      sha256 "9eb428ef5cb1dc1832b3baa8d2a64f6c04edb816fd51989c81f502049b52480d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2148.0.0-linux-x64.tar.gz"
    sha256 "9c09876796a1b98730cbe015c75f343898f9a8b05b445d947fc1f2046055e1ae"
  end
  version "2148.0.0"
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
