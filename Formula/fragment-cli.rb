require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.3-darwin-x64.tar.gz"
    sha256 "f72da58b929282c76dd34eb2e2470f58c22752c676288ca2bf5dcffef5135dcf"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.3-darwin-arm64.tar.gz"
      sha256 "327b8b3ef1c490f1a1184fa8dbbbacb65aee58196252bf6e2d8a832166f5cc25"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.3-linux-x64.tar.gz"
    sha256 "b867863eab667d9112fbd2d43c55ccc8b413931f2cb6360e356b68e6368a50d6"
  end
  version "2024.10.3"
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
