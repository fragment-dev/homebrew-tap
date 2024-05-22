require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.22-1-darwin-x64.tar.gz"
    sha256 "1bbaae6c887aab1b1d67d6bc6602d3329e5ffecbf8cec5bd97462712d9569522"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.22-1-darwin-arm64.tar.gz"
      sha256 "9bc886a18cd5dc2eda22ca4b38c22b2f63a686b8ae226dff13dc75d0ef4f1cc3"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.22-1-linux-x64.tar.gz"
    sha256 "29d883149b5f1a08c30bf6bdced5e0233d7ee3c1ed7cdb4dc09fc2efa31de07a"
  end
  version "2024.5.22-1"
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
