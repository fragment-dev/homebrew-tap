require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.2-darwin-x64.tar.gz"
    sha256 "1b05da430734d24c8dca43d97eb4d479493e8b260e411b6de39505c0bebf95c4"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.2-darwin-arm64.tar.gz"
      sha256 "fb6fc3ca89245f2b895153a9924531507568399aecaf62f416c648698c19c56f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.2-linux-x64.tar.gz"
    sha256 "c341bd6a77d1e23f7ae15a67f99ecfb6c736834fee7592879c09261c96987956"
  end
  version "2024.7.2"
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
