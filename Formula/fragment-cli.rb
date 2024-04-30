require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.30-1-darwin-x64.tar.gz"
    sha256 "5776e8c4ed1ce69dfe5e2ddb39b23012f06e43a1ddcf0eecaa5b3e06925fab5d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.30-1-darwin-arm64.tar.gz"
      sha256 "03cfd7fb58fc918c826f0784fb7bc55cf5be6ec615b5f390598797b9f7d8eb91"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.30-1-linux-x64.tar.gz"
    sha256 "1eb54ec2fce7bc516836ee11ba9d0e398491ea7e560a846aa0c4a733af450a18"
  end
  version "2024.4.30-1"
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
