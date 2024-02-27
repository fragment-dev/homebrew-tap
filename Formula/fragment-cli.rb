require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.26-1-darwin-x64.tar.gz"
    sha256 "897b66c12e8235be2124c4783d394d05cada0380bb917a013d968dd1931aad82"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.26-1-darwin-arm64.tar.gz"
      sha256 "b494e0b8ec8ad4c05f2946f13c951f9033f17663f4fd2064f544c73d73a72c1b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.26-1-linux-x64.tar.gz"
    sha256 "9ae1a22865856c42482bf56da0fbc90f815b8e68fe55cd20d845a53233198a71"
  end
  version "2024.2.26-1"
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
