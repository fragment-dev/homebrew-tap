require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2611.0.0-darwin-x64.tar.gz"
    sha256 "2512fd1bc359e75e40f37825eb1dd30ebaf7c5fc4f60cbb82ba01c989390f16a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2611.0.0-darwin-arm64.tar.gz"
      sha256 "8990bbbe1881ed904c633fc9a9df36aa2c19b3f664eb22c9cf1973a360e005c8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2611.0.0-linux-x64.tar.gz"
    sha256 "cde5eaa01e9fa1c0a5a27dbc59352df99d3b65d5d34204d80661193bdb9fd8d2"
  end
  version "2611.0.0"
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
