require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.4.18-1-darwin-x64.tar.gz"
    sha256 "5c9d46a93de2052572ed6ecb999cd0b4241e8a51df2b9df43fa07bd7e557f282"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.4.18-1-darwin-arm64.tar.gz"
      sha256 "68681c329f6c9b688dde4314c22c160b4da29d8361bc429eedd1cd445c1b5e54"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.4.18-1-linux-x64.tar.gz"
    sha256 "163728ab3faf48d43d59437c041541f97cb20098ae2ee161c1437b1d67294686"
  end
  version "2025.4.18-1"
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
