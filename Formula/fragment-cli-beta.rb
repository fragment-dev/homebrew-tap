require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5419.0.0-darwin-x64.tar.gz"
    sha256 "c31bdff77b96079f0b31edd180a64ffa1b61811a3463d4fc4733673a09a950f1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5419.0.0-darwin-arm64.tar.gz"
      sha256 "c754c46db1628e089b0d3fef68a6b1f32d71f2f3c0a0c6be392c0446dec4b896"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5419.0.0-linux-x64.tar.gz"
    sha256 "26361f17b5932f89b5a5425cae766198065b966af07af40edf354fb524558af1"
  end
  version "5419.0.0"
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
