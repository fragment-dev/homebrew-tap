require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.22-darwin-x64.tar.gz"
    sha256 "3285cb7e38bcb2af1141b180073a3bf03a5ecbe6b25f1264f37071cd8a4c0a8f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.22-darwin-arm64.tar.gz"
      sha256 "2484ab71a367445a364b5565033468aaffbc42194d328dc9888c10f56affb667"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.22-linux-x64.tar.gz"
    sha256 "e05c076c1a6e9eac1fbb80e30dd3086500f9a81d5a73e32deedc905fdbf78376"
  end
  version "2023.8.22"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
