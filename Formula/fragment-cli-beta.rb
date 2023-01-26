require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1844.0.0-darwin-x64.tar.gz"
    sha256 "f0fe71b236c4f84d74bb562983a925e57e820467af8caac99df70ed968a59d8e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1844.0.0-darwin-arm64.tar.gz"
      sha256 "eb9896a4dd163cb71de05dcdffe77231e503403eefd997ac56a501e84205a90b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1844.0.0-linux-x64.tar.gz"
    sha256 "6005894b43fa87df22390ed58e162d36a28f8892a1da31fd19a3fffa102699e1"
  end
  version "1844.0.0"
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
