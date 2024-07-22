require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.20-darwin-x64.tar.gz"
    sha256 "41cae064a27da73ab7dd4f2ae2e089935c3aefc721e90a39f6079562c4e0d365"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.20-darwin-arm64.tar.gz"
      sha256 "669071e79acce80a97e644a3fd7ddd3c1cf757e2e5eb4311fb249f39db898150"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.20-linux-x64.tar.gz"
    sha256 "494c1ae6fd92996aa42bb41855dcf7a84eb97a600826c8d163b4e9806af855f9"
  end
  version "2024.7.20"
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
