require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.23-darwin-x64.tar.gz"
    sha256 "d1255f384469bc72bf2f5180bdac88bde5031883d3b70f0421cc36fcb4ab7c72"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.23-darwin-arm64.tar.gz"
      sha256 "caf863b944fd9108d36c50711cb070b67d688db63112b8e05e3f763bbd274395"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.23-linux-x64.tar.gz"
    sha256 "012d761e9ec1ddf7f94e72bd9611d3e79529fa5836590c39baa84af285bfb972"
  end
  version "2024.9.23"
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
