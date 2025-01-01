require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.31-1-darwin-x64.tar.gz"
    sha256 "8716a8e1b117a58f046a676dbebefab48704c7f933069538b5b70412b83c5f36"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.31-1-darwin-arm64.tar.gz"
      sha256 "5e2fcd440bf99049d4cde02ff43cbdee2af563c9645d89ecf0b8f8111a26ba94"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.31-1-linux-x64.tar.gz"
    sha256 "fc5b15dba41be961c5e5a4a37afc6f2a3983198c207238ee1be33d1184e93e0f"
  end
  version "2024.12.31-1"
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
