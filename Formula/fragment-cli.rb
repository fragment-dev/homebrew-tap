require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.6-darwin-x64.tar.gz"
    sha256 "497bb3c9d7dd350c168b3bbdcba8d610508b9722eee56a94d9687362d01aa1ca"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.6-darwin-arm64.tar.gz"
      sha256 "2a31deeedab9f2279cbfd3c29db5fcd3c039b758e084f3d39709acd781b57892"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.6-linux-x64.tar.gz"
    sha256 "5a8a8180152428bfb3ce2e203b6d833eb26ed69c7bc01d4fb941d2f7728305d7"
  end
  version "2024.6.6"
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
