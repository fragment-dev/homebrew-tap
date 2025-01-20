require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.20-darwin-x64.tar.gz"
    sha256 "b6a89406e5688100ebfce597061f1d2049ac8302d76448e0647aea2618e3fdcd"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.20-darwin-arm64.tar.gz"
      sha256 "c397e8e19980ddfe0d15c8f0cc196f39610ddec065fadb85fc9d6c026eba7098"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.20-linux-x64.tar.gz"
    sha256 "8ee65467504f277dd19833a1ac09f913c39d2e42e97f2a94772f14e2840f7a5b"
  end
  version "2025.1.20"
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
