require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.18-3-darwin-x64.tar.gz"
    sha256 "d04524cb1dcb31154c624b9a97626411be82d4bc975f57a7ec0c63bd0b48deca"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.18-3-darwin-arm64.tar.gz"
      sha256 "73996eb45757435ea535f9f6312008c93a75d474f744a1e75de63c92887f0612"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.18-3-linux-x64.tar.gz"
    sha256 "f9acd3d4c403e857b8cca7451ef6b56dd6c76ad939cffa8005749bab5bf959d8"
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
