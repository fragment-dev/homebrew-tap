require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.5.14-darwin-x64.tar.gz"
    sha256 "506298b755c57eb9c4d9234cb21e488d1c58f3ed4ca2ab8a97ca5d21bf9bf08b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.5.14-darwin-arm64.tar.gz"
      sha256 "984bdb399d63ce89df882c448affeb5b17df5ea2fffd7c42487a5143cf67a841"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.5.14-linux-x64.tar.gz"
    sha256 "66646ed6135ec234674046faa445f0ce18fd5025e4d2b524ef994e7005c29f53"
  end
  version "2025.5.14"
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
