require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.12-1-darwin-x64.tar.gz"
    sha256 "d79bc32fa37bb4e5f9d7970aa8ebede5c54660c1407a6e6c177c6367adf3f5e2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.12-1-darwin-arm64.tar.gz"
      sha256 "ba06b6f2e0176fe47a7b609bd2ea5d98d1513cf64b2655013938fc922053df71"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.12-1-linux-x64.tar.gz"
    sha256 "ccc35411039a7f525a409e12979e8ee4cea7888f425f0ae58a40e869204160a4"
  end
  version "2024.1.12-1"
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
