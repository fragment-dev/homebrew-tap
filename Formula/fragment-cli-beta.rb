require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5411.0.0-darwin-x64.tar.gz"
    sha256 "ba02becedeb2bf0c4fc94e74cbacb1b5ad75cad474c9dea90c432d07e6b7d627"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5411.0.0-darwin-arm64.tar.gz"
      sha256 "b994349b074f3bd731241ddb3f9ddb7dcbb83df41a07c7de0856a92bcbb5d217"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5411.0.0-linux-x64.tar.gz"
    sha256 "2d26b5c4b695c0bd77d5581ac9b28507bf8f252d3f58fd90eb91d885b7b4f4a6"
  end
  version "5411.0.0"
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
