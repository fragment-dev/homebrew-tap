require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5604.0.0-darwin-x64.tar.gz"
    sha256 "77c840dc5a379bd73484b8d354ab458f79f8b64fd7a3c7648b63ca362be60d62"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5604.0.0-darwin-arm64.tar.gz"
      sha256 "a96e7221c3f6e600c002d329b6327d004cc7ad0731a1a250ba5c3ad791d26783"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5604.0.0-linux-x64.tar.gz"
    sha256 "0ff8fe868e5abd0c629f616c44ec39c9d0fa4f30b9b08c7083378f9afce746f6"
  end
  version "5604.0.0"
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
