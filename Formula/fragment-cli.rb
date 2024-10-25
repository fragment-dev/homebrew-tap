require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.24-1-darwin-x64.tar.gz"
    sha256 "d87565d2e71710e34d15e328f9172f8fde6c0d4ceb5a276b27d6ac804d41c13f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.24-1-darwin-arm64.tar.gz"
      sha256 "2435f53f547e78449d78594e4b51e4bcefe90ea532356c856e436022d32310b2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.24-1-linux-x64.tar.gz"
    sha256 "c013325671e750a90731e37b007f30484b85c3a6f87fc6382e3a89c2c379e888"
  end
  version "2024.10.24-1"
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
