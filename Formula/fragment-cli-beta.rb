require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5970.0.0-darwin-x64.tar.gz"
    sha256 "39e25521fcb310e09620e6cdace4c6af347675109ce7e3e980d4e5483fd6028d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5970.0.0-darwin-arm64.tar.gz"
      sha256 "6dfe2f583a3e97aa801a66f3a38147bcb554a4ba550ff680a990ea879733ba34"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5970.0.0-linux-x64.tar.gz"
    sha256 "7da23200ee6120706d2ff4168c2b2eb0750a067fb6291691a9e521219e4c6fbb"
  end
  version "5970.0.0"
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
