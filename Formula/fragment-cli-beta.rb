require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4777.0.0-darwin-x64.tar.gz"
    sha256 "ce9f5d45551914dbc2e8d7fd63bcd1f6738d824f1fe1b83ab1ce0423b86c1dfe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4777.0.0-darwin-arm64.tar.gz"
      sha256 "d943d26ba446f627b107dde9f43038c12a0780445d013d9e55623ccc6b67ddc6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4777.0.0-linux-x64.tar.gz"
    sha256 "e3b901bf23e17e75e74d62c1e3031211580d57535cf97e3451fb5c872f54480c"
  end
  version "4777.0.0"
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
