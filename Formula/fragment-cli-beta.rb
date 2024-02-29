require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4672.0.0-darwin-x64.tar.gz"
    sha256 "a510c41d1fff23e2ef35907159bfb947bccae761ba4e9e017d1800a21595a9a3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4672.0.0-darwin-arm64.tar.gz"
      sha256 "47806240ef9e0c00693ef34350b4eaaafdab0ab87181bcbd94fe430ef0967f79"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4672.0.0-linux-x64.tar.gz"
    sha256 "db8a9a9eda71ddf2345dae7822ae209ed7dbead33c92157fd2387f85c4b57f4e"
  end
  version "4672.0.0"
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
