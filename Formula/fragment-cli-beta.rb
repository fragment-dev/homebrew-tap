require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4194.0.0-darwin-x64.tar.gz"
    sha256 "0ee8e49e7138b852af0e28e3dee544b24a54a5a1bf86fffad4df621d37998bf2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4194.0.0-darwin-arm64.tar.gz"
      sha256 "510d49d869b006aac3eebebf363ae1c5a9b423446d3ce011db40a1855d77d72f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4194.0.0-linux-x64.tar.gz"
    sha256 "d016d0a81e2cdc8767b4a453cdef0c69a81f87d6c19b34b9de120fff7d2ac246"
  end
  version "4194.0.0"
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
