require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-2-darwin-x64.tar.gz"
    sha256 "24819b66978d7b0c494401b1b033664a17451c67bf366a5c53fc1f098a7d1a52"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-2-darwin-arm64.tar.gz"
      sha256 "f18a2a1c9209d8cd57d26be103c9359317bc8d0229d8d6f7eed75f7de71f3fb2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-2-linux-x64.tar.gz"
    sha256 "0e21acc68afbb8006fbf68e17599dca92c63dd2dad03cff5e91bebcee011039b"
  end
  version "2024.12.24-2"
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
