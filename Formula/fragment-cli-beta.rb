require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4689.0.0-darwin-x64.tar.gz"
    sha256 "f1a893edd996f8e6ff37b9920ccbd6d2ddf1bd5f4851e413d0d9b666ae171546"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4689.0.0-darwin-arm64.tar.gz"
      sha256 "72aabeb1b225e2c877e180fa360164cefea22d79918985256caa278ee252b70f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4689.0.0-linux-x64.tar.gz"
    sha256 "4721f12d3ee8140fb2e36f61f3f25f62937120ee83fed9b92e41f36a64837772"
  end
  version "4689.0.0"
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
