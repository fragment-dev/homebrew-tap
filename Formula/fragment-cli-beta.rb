require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2434.0.0-darwin-x64.tar.gz"
    sha256 "8981b26b300d74e6df1b9c94571101a1b2d33a99b0a02692c60999c42bb953f6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2434.0.0-darwin-arm64.tar.gz"
      sha256 "d4f118ce7bb9c5917c9ce1d8f6864726caf301fe58b0c0d605e5c2a2a3a218dc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2434.0.0-linux-x64.tar.gz"
    sha256 "cf488b4d8dbf83949a081b2bf9e44d7ea39ea7ac89c77e118d9c509714b07e2a"
  end
  version "2434.0.0"
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
