require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.20-1-darwin-x64.tar.gz"
    sha256 "0c8e4e13465dfdee49dc8f7d7e6ff40b1ba02153fc71757f396dce8d107a493e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.20-1-darwin-arm64.tar.gz"
      sha256 "8a80a1c380dccfd5d106e2e5b1bde819c8d2a1fe294a0b24641152c9827670b3"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.20-1-linux-x64.tar.gz"
    sha256 "ba67ed81d52d5cf43cde71cf80c6686d58440026f44d0462bcc22ac669cff5bd"
  end
  version "2024.5.20-1"
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
