require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3382.0.0-darwin-x64.tar.gz"
    sha256 "74cb33c3b75dae51341b3eabaa7163d9ceea6be328777bab9bfe282b7f43ccc6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3382.0.0-darwin-arm64.tar.gz"
      sha256 "3a2df2c7374d0adc014c5c26a8a559cb6c8c6938df05644e60cae39473a4f82f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3382.0.0-linux-x64.tar.gz"
    sha256 "12544d419b41ebf55b7cc8e166996a34f0b8100ac13e9c7be772caaeb04fc8f2"
  end
  version "3382.0.0"
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
