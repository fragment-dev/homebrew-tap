require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.14-darwin-x64.tar.gz"
    sha256 "164f064725c3ce026a9403b8b8a7187ded2ec52e5c89d68871fd6d4079666448"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.14-darwin-arm64.tar.gz"
      sha256 "d615355efa02802e64929c0f9eab5df7522784b76a6d2d6e7f7cba17279bb7c6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.14-linux-x64.tar.gz"
    sha256 "84a8cd89890ca480b9992ecb49f784fe499f3d83f1e923dbe946ba3db1e81864"
  end
  version "2024.6.14"
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
