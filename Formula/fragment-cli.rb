require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.14-darwin-x64.tar.gz"
    sha256 "134010714c13f05ace7c6d4140b8a2b5ab62a4d57fb42ae50724b1f9f5fb685a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.14-darwin-arm64.tar.gz"
      sha256 "fbfd707e0251c318fdcce952ea62debb091857c7039da114f6a90519feef3919"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.14-linux-x64.tar.gz"
    sha256 "7ccaa73bf8f70750de284db58c74be13930ea505b26f3b2208f67626918175c5"
  end
  version "2024.8.14"
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
