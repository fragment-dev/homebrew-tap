require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.1-darwin-x64.tar.gz"
    sha256 "689003855b4a8f3b2d2adf6bc8247cd04b9b24f58f068989d918cb4fca73a56b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.1-darwin-arm64.tar.gz"
      sha256 "f22930d32a6930d75576271b01e0120c18fcb2308df984f1c4140887100a19b1"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.1-linux-x64.tar.gz"
    sha256 "0977213aec08cc67d8643beb346ce6744c8b03d0eb0c4e11806d79e954db6484"
  end
  version "2023.5.1"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
