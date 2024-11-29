require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.28-2-darwin-x64.tar.gz"
    sha256 "7cd11b096cd1c056a6f540772770ddae6defd91a2329e48b30dedd0c811c5c5f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.28-2-darwin-arm64.tar.gz"
      sha256 "ba759fed2efda6afce98083dd046d224609e033159c132bf8229239049424336"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.28-2-linux-x64.tar.gz"
    sha256 "e2c251a06c5ee01d17c76dd7bcd41e36077a1f3e9b72488321f1b5dafcf334e0"
  end
  version "2024.11.28-2"
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
