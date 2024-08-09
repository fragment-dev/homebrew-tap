require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.9-darwin-x64.tar.gz"
    sha256 "eabd0fc0f82cbe40c6b075c76bc1a6d42a5af17be9e1ba27605c4cf9bb74332d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.9-darwin-arm64.tar.gz"
      sha256 "73d1f39dc72046d8b11d97001b995702df8be17affaaabdab43db840c1172a8b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.9-linux-x64.tar.gz"
    sha256 "3ea7dcac1fbe7f1f5d64b9ae5f29fa2705910f2ccf5b00d7a281aa7f4836f6c2"
  end
  version "2024.8.9"
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
