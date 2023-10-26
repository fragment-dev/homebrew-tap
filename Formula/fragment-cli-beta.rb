require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3908.0.0-darwin-x64.tar.gz"
    sha256 "2f1b565a316d4195786d2c5592d36ce1652ef36e5590c85638cee8511e04add9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3908.0.0-darwin-arm64.tar.gz"
      sha256 "707524244c457dce609e75686bef8d4e9cca7b6d3d94c726efc0dd3daff9edcf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3908.0.0-linux-x64.tar.gz"
    sha256 "7fc27957b6d0cd57da388e54d6858a6bdfe3b664066776ac578ed59b8a7a601c"
  end
  version "3908.0.0"
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
