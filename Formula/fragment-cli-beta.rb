require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2725.0.0-darwin-x64.tar.gz"
    sha256 "9a3a9bfe1d00f1fb19596169eb51e0eef8cf4d82e7f7135ed9c4f0647f252245"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2725.0.0-darwin-arm64.tar.gz"
      sha256 "373740a9b1231990a9cd2a8ce2d38795e1c33a836ea8044c99c1790776182473"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2725.0.0-linux-x64.tar.gz"
    sha256 "fe28e64e5ab3cba316ee2bd36dce32de5994471f2143f83cb78546ea2a7da132"
  end
  version "2725.0.0"
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
