require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4857.0.0-darwin-x64.tar.gz"
    sha256 "3082292713984dbf485e9641156bd09d363b576c59d855a986210c38f4b5d545"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4857.0.0-darwin-arm64.tar.gz"
      sha256 "a8ac4b64ddfa2d130deb89f52e01bbf0ca2cc351843ff9824f6d9ecf0acbf015"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4857.0.0-linux-x64.tar.gz"
    sha256 "97c685578f85686ed8403442b1b2f036dfaa84e44d898573d028420b94c5f9a8"
  end
  version "4857.0.0"
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
