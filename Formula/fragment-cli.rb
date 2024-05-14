require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.14-2-darwin-x64.tar.gz"
    sha256 "67cd912f1f2f600aef4eae08b3225637445652927f89f4792228fde69021bde1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.14-2-darwin-arm64.tar.gz"
      sha256 "9f5a7cc24e32ba205be4b6496dfd71aa00a8ea670b0064df4ec367ff974f7719"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.14-2-linux-x64.tar.gz"
    sha256 "cf9f7544a3c8c4a84f29e3085803cfd48617e1a9d172f14886b11825b9dd899e"
  end
  version "2024.5.14-2"
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
