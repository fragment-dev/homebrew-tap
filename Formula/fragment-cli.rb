require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.2-1-darwin-x64.tar.gz"
    sha256 "2c36a33b369f9bf623b9ef7d8e0dc7c6de2a43d09b2ec5ecbced1cfaf1a267f9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.2-1-darwin-arm64.tar.gz"
      sha256 "d76fce66d417fecc43721b8c30ef7a72a6cde6104b1e7db91950b11697092d17"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.2-1-linux-x64.tar.gz"
    sha256 "d9a51209c441116143ad8cc6f628fb00888987c92357da9d147a3516eea64c73"
  end
  version "2024.8.2-1"
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
