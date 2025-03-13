require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.3.11-darwin-x64.tar.gz"
    sha256 "087b1256c75cf353245b11fc4c5609f4d7b635bafb6a69390db411914d0124a0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.3.11-darwin-arm64.tar.gz"
      sha256 "55307c70e4fbcbfa975003a8a75b0bcc2585940e2ad7acc54f557476eea39616"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.3.11-linux-x64.tar.gz"
    sha256 "d3739b86a457b968a2d23392cd926beb494f29cc2c37a3044ccef7c3054ccc7e"
  end
  version "2025.3.11"
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
