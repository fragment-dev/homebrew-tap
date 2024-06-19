require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.18-3-darwin-x64.tar.gz"
    sha256 "01d35738b88d76df8dd9108329e0de22300418113ac0f780b0bd9b3f6df51eb0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.18-3-darwin-arm64.tar.gz"
      sha256 "4d7065cc94c404968f3f6d99f8c61d1e44508489ac9f45c0d1976615c7db1faf"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.18-3-linux-x64.tar.gz"
    sha256 "14f73339088ec4af94af03308b7f49d1281ac551106b3bfabd4a48286ffd81c0"
  end
  version "2024.6.18-3"
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
