require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4050.0.0-darwin-x64.tar.gz"
    sha256 "ec23e34e08c59ba7b71f8fa5a6a1b76d63f7f61a8003e02228669d8456dac924"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4050.0.0-darwin-arm64.tar.gz"
      sha256 "1be288da7225c3c156a2c0ee702976c23ed8b886d8ab9f37c04e9e08b63d51f1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4050.0.0-linux-x64.tar.gz"
    sha256 "1b360b3baf067b0cda02f00d3678b2f5db57ce72b1decfb998c9c7ba7171c92a"
  end
  version "4050.0.0"
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
