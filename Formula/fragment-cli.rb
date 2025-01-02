require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.2-darwin-x64.tar.gz"
    sha256 "98049f851645d8170b9054c31891faa715089b3bb536d1219bd51cb1c5ad2a34"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.2-darwin-arm64.tar.gz"
      sha256 "5fe6644e716cf3b9bc9cc6cb164c9d89b78f950ed615cd4102eb2c8dd2e17e8a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.2-linux-x64.tar.gz"
    sha256 "685d958aa62526b1b9726d41c2adf0f400fa34a3346136e2d2042b5db2cb5624"
  end
  version "2025.1.2"
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
