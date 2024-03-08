require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4731.0.0-darwin-x64.tar.gz"
    sha256 "cf9d176488027b75a20b88e27a772fbe2e6487cffcc48eb9cdf89b610077f121"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4731.0.0-darwin-arm64.tar.gz"
      sha256 "ca10dc1820c932afe129b2888c289d062bfa5814bfd9f0388723a71b447831b1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4731.0.0-linux-x64.tar.gz"
    sha256 "fedd1f701d805ca16878fb35dbc39c7026b3d688c35f2c190e872f104c969cb2"
  end
  version "4731.0.0"
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
