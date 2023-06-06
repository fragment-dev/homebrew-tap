require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2803.0.0-darwin-x64.tar.gz"
    sha256 "7290cbcc60015b067099f70f2f2a795cfc59f7061ab9ac26f0f0945b5f415333"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2803.0.0-darwin-arm64.tar.gz"
      sha256 "f154bfcccb82597ae4f0c0bc00447c64f9bcbca9e882d894adeca986f57ac114"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2803.0.0-linux-x64.tar.gz"
    sha256 "77404739d0252fd66b18ab8db1a2e95a85593b6c23bdcd38c4d02226d37a070a"
  end
  version "2803.0.0"
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
