require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6619.0.0-darwin-x64.tar.gz"
    sha256 "1ae350fd5f27b3c8b06729657e3a7b43955b6e91ec8449bca0fef2798b0185be"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6619.0.0-darwin-arm64.tar.gz"
      sha256 "5b4da8e5c4be3f5c4f51537e55a71e800702b6cf3d172e04dc2b14bc613ec26c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6619.0.0-linux-x64.tar.gz"
    sha256 "bc7499dbf79c166b4a0332aff40f92ea33e49e1ed5e9ed9712cb5cd357b05886"
  end
  version "6619.0.0"
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
