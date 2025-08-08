require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6938.0.0-darwin-x64.tar.gz"
    sha256 "3f5b025e557692a09f67fd0bd097f1ead16eed8e5eba1960f23bf6026d3f33e9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6938.0.0-darwin-arm64.tar.gz"
      sha256 "a36205d43ed8f410a04f3730ea1206c5e58b99685f030e2e4aa46bb0822f1d9b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6938.0.0-linux-x64.tar.gz"
    sha256 "b958c482714fa758943b04981a835f3a759c8c76d065db222ac4a0b09cfb92fd"
  end
  version "6938.0.0"
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
