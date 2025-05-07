require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.5.2-1-darwin-x64.tar.gz"
    sha256 "8eaf6a405bab151a506e20995f767c9166d35c2e4392d8689243c5bf48c8bd76"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.5.2-1-darwin-arm64.tar.gz"
      sha256 "95ce49392fd4d480d5fe2edeee2c3fa140178f7c487ab51d8ce7936ee6323d93"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.5.2-1-linux-x64.tar.gz"
    sha256 "9604a09f6ff5c1089d7f0a008fda4980963cad57b213c9a124cccb0b17e2b23f"
  end
  version "2025.5.2-1"
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
