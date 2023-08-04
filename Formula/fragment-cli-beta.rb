require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3248.0.0-darwin-x64.tar.gz"
    sha256 "56b7daca0598064a4fa4f3c44fa17aef5cf0da3dae290ad30d3116d34dfea24c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3248.0.0-darwin-arm64.tar.gz"
      sha256 "750b0f79d1e3f3ca9bb96d3402bc1c34de5608bbc6922f8ed08138c018fcff89"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3248.0.0-linux-x64.tar.gz"
    sha256 "738963f1f1b1cbfe947a356315cae01537c1f55bde687d55e2c8eb569a71467b"
  end
  version "3248.0.0"
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
