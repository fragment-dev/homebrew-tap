require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-2-darwin-x64.tar.gz"
    sha256 "5759eb759d28d7d0196be35fd7ae713388e983a5a7f4542f64c99f75c088918d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-2-darwin-arm64.tar.gz"
      sha256 "cbc26377130e3a8b5fdeb73a8ffb2c0bf10489b3d2a9677a95074acc3859ec79"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-2-linux-x64.tar.gz"
    sha256 "9e96e0618da968194cee1dd0de0f1247e12a64f7c2d3e3be3609dbcdc44c7da8"
  end
  version "2024.12.20-2"
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
