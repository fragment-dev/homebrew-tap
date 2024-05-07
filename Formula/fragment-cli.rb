require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.7-darwin-x64.tar.gz"
    sha256 "4c4a0a10f3794c5660ddd364503d96228c315fb483ec930c8022e74661544b7e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.7-darwin-arm64.tar.gz"
      sha256 "a443cd2b591a0445e11d6bbc02e3c51f825f12e697627884d4369c8072ba80bd"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.7-linux-x64.tar.gz"
    sha256 "eb4b67a304fefed55db45a28dd52ccf922cafca976502d93cbc735c7ee23b828"
  end
  version "2024.5.7"
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
