require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4942.0.0-darwin-x64.tar.gz"
    sha256 "4455803ae84d89226033fce4b8a95ded0e33db511db0387a5c8ab62b9af9ed8f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4942.0.0-darwin-arm64.tar.gz"
      sha256 "b381a58f3d8e5c73814bbbcdffe616d482de0c900e99998a3b78f0e4ec84e0c8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4942.0.0-linux-x64.tar.gz"
    sha256 "d607b5f53e7c3b2f9ded76af63e5b698fa9b7381996446f9293ad43c074e1880"
  end
  version "4942.0.0"
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
