require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4241.0.0-darwin-x64.tar.gz"
    sha256 "cf1fa9963897f928c0c59cbe4f5645659cb40a07a42d69172266dbc3467dc29d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4241.0.0-darwin-arm64.tar.gz"
      sha256 "7da3312db32fd5072175f160b64ef754f37131d8350ff359cee6a2be1d6c966b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4241.0.0-linux-x64.tar.gz"
    sha256 "fc361b12b273d9a0851b9c52e88466720cbcf9cdbc8a60889a9cb44f6df9805e"
  end
  version "4241.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
