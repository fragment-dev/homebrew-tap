require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.21-1-darwin-x64.tar.gz"
    sha256 "24859bfeedb3fcec143ce1ff8b6ca2bf7e97373f311a5ffb94ee7a60790ffcef"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.21-1-darwin-arm64.tar.gz"
      sha256 "ea45b70d255ca680e60b2c110cd3b2c6ff51615ba7952c2e985e5ad623df3a04"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.21-1-linux-x64.tar.gz"
    sha256 "b95ad92e4c2d38c53b7e2492a5004fb2cb69e406aef45ecd3032419632e437be"
  end
  version "2024.3.21-1"
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
