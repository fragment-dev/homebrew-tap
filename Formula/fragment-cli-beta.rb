require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3695.0.0-darwin-x64.tar.gz"
    sha256 "ab1ea793c6287125b370fa8eaf81a54843cb94d5cdf5c912789cce63f412f06d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3695.0.0-darwin-arm64.tar.gz"
      sha256 "b72d0658faffb8450390d51d729a3766f64db85890ef9c5ed7ef0d3dec998805"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3695.0.0-linux-x64.tar.gz"
    sha256 "5b0b365553d67c01a742ab67f673775e90e46b1d3ae8dfb7d7f27920b92994d6"
  end
  version "3695.0.0"
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
