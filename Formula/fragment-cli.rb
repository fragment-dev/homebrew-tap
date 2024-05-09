require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.9-1-darwin-x64.tar.gz"
    sha256 "662915648b1896a837880ae4628c0f4a606370f908b7973fa746d4bcc092f3c9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.9-1-darwin-arm64.tar.gz"
      sha256 "7bd8ae3c1bb2a0871868e08aaff10ad14567009df42dc446fd3b24bf45b128cc"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.9-1-linux-x64.tar.gz"
    sha256 "34117633d22ff13eadb2432d1c74ebfc42239b6d343a0d11054feac8fb62d1a4"
  end
  version "2024.5.9-1"
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
