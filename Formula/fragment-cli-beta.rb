require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4534.0.0-darwin-x64.tar.gz"
    sha256 "810b0e73bcb2c2c87e4867d91c97c553776bce2395002e390fc0ecb0392f5391"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4534.0.0-darwin-arm64.tar.gz"
      sha256 "2637d93dbc3bdeb1d849a33b72b6fefbee3a1351fb8ec249e9b6d4baa0b85eea"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4534.0.0-linux-x64.tar.gz"
    sha256 "fd1e53ba38a0e956dfd2d7dc892fae2ab1e961a05d9dc8be3cd8c21f7cc65556"
  end
  version "4534.0.0"
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
