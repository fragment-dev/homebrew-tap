require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.27-1-darwin-x64.tar.gz"
    sha256 "f0fc810b27bf58de798f0360fbc73cc22a329c81378458b6632ca7361fd229ab"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.27-1-darwin-arm64.tar.gz"
      sha256 "04515cf6066cbaf2280539770ae4eb0cd8c05f68f4020b71baba061eba02726b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.27-1-linux-x64.tar.gz"
    sha256 "722589fd46f2c30b7e8c7dbfe6919aa3d33f072524f6b3aa2a6a400b2ccff27c"
  end
  version "2024.11.27-1"
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
