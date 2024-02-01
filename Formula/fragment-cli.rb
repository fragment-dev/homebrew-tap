require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.31-1-darwin-x64.tar.gz"
    sha256 "cb6ac7278c5a0e4ee643c574cc1f2d13fc7154962498c238e5e620fd27e08921"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.31-1-darwin-arm64.tar.gz"
      sha256 "b8d58da069b37de540064ca5615b857bcc74d983bbd79f2fe90f7e898fc2ab85"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.31-1-linux-x64.tar.gz"
    sha256 "98e3d4ef9928164c715a93f903606f6bafc4136fbb4c2d62b8e35bee91a89477"
  end
  version "2024.1.31-1"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
