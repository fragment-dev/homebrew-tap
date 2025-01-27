require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.24-darwin-x64.tar.gz"
    sha256 "d23754e7614a20cfd0a21ca965fb1e2860cbf845295f4aefaeec851a36fe5d3a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.24-darwin-arm64.tar.gz"
      sha256 "57a61f6fc36019d77ed2a6f1adc5b2cf2ead6941f3a86eb5743eb687acc9a13d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.24-linux-x64.tar.gz"
    sha256 "b84170c568dff066df0e32ec917f2d52cab3addecf5175fc39b9b8a88eac6195"
  end
  version "2025.1.24"
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
