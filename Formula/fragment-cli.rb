require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.10-1-darwin-x64.tar.gz"
    sha256 "25740a43f2d8de1d0a9c87a2aa57f6cd30c87e98d52bec5fdca56e7bc2edcc03"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.10-1-darwin-arm64.tar.gz"
      sha256 "e680bc6eae8f36cc9b6cc05f83f750b42ec3c651d9db7993ae1f96ba76659003"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.10-1-linux-x64.tar.gz"
    sha256 "e461a9a930cff5c93742edca7c03756201dc92d7eeff02a53204e15dca0e592d"
  end
  version "2024.5.10-1"
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
