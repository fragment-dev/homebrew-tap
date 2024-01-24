require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.23-1-darwin-x64.tar.gz"
    sha256 "17d544ea11388572d23765e5ce7036d10c4a6dae99c8294e343e7d87077ffbb2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.23-1-darwin-arm64.tar.gz"
      sha256 "348a2c2e1425b120e69da4b159f07be48323c01d638c7e5b4880caa89c4bcb44"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.23-1-linux-x64.tar.gz"
    sha256 "466de42e89e6493946975cc38cf1696f883d3cd05d06028ebe94e5503b4d6d30"
  end
  version "2024.1.23-1"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
