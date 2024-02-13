require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4548.0.0-darwin-x64.tar.gz"
    sha256 "25f8e1f297a2659d92a8e7026f9a5a23da30185c981ba77b87532402f9cd9780"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4548.0.0-darwin-arm64.tar.gz"
      sha256 "774d21b979ba3b59d675f58c73fa334b30e241625ee3625d45ff6f6174cd2b9f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4548.0.0-linux-x64.tar.gz"
    sha256 "742458661cf9bc0c11f24678bd0c1b391ede499d2b766054f7ece21f31d8e999"
  end
  version "4548.0.0"
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
