require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6104.0.0-darwin-x64.tar.gz"
    sha256 "f41670dfa064ae95d35593fd564fbe883a42ca5b2cdc3a3dcb39a8ff88dc3024"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6104.0.0-darwin-arm64.tar.gz"
      sha256 "8e2fefe1f05298cd3071f88cdf4f1215897db5e1ec7506dbc4dfe8e5fc09135b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6104.0.0-linux-x64.tar.gz"
    sha256 "74912825db4729c352023965c1296f3ca27122592a5cda8c77dcd1f5d1d46547"
  end
  version "6104.0.0"
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
