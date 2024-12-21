require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-5-darwin-x64.tar.gz"
    sha256 "41672c29ddda9cdae5e4b8c6ff110889276a5fbc5b5f07c1c8effa2e006471e9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-5-darwin-arm64.tar.gz"
      sha256 "f473b38761c8ab081955f54607b97c267eb9e20224a356f54ab3c3066623c233"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-5-linux-x64.tar.gz"
    sha256 "e74fdd789edf46c6dd208b16266fb379e2ff27f03f1e291a2962e0cb9d6fede5"
  end
  version "2024.12.20-5"
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
