require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4858.0.0-darwin-x64.tar.gz"
    sha256 "94977d27660df1a6a6de9df2f1b56fc29bbb68806a7cd14b7ca359d53b96f5fa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4858.0.0-darwin-arm64.tar.gz"
      sha256 "cbbad99503498ed25ea2a27eae0c5a3eaea70f76e44db072e57313fa1c0b44a7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4858.0.0-linux-x64.tar.gz"
    sha256 "1a2d48f23b9bd43c5e20e2090e7358abb5c53532973ac74f3b48a48439d2ac6a"
  end
  version "4858.0.0"
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
