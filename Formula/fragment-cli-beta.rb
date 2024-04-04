require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4852.0.0-darwin-x64.tar.gz"
    sha256 "7299ee288163aef761a6c9f648bc3de624558117ad01b7b01620e34fe2419a76"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4852.0.0-darwin-arm64.tar.gz"
      sha256 "0c4581ec803c6c17e7a97cedbc208eb084b5a62fe440e25bef2a2edeac5da9e7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4852.0.0-linux-x64.tar.gz"
    sha256 "361ffb2dcb62fe9f27a75e9cccbb7065b3edc7c6a6e913e25a36c9e4aa7fc6a3"
  end
  version "4852.0.0"
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
