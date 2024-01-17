require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.16-1-darwin-x64.tar.gz"
    sha256 "4244d3cb44d896d66dd6f5fc969b2aa8f09b9b67b3d97aa3216847497dd25d5b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.16-1-darwin-arm64.tar.gz"
      sha256 "bfb41a47be366c8d8311fe5a9f5759428b932ad20658ff6e7174014b701b4eef"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.16-1-linux-x64.tar.gz"
    sha256 "ef0cc3fb20fe95156bce8725b8127de9eeb4a6a9b09149e956e0644350adaebf"
  end
  version "2024.1.16-1"
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
