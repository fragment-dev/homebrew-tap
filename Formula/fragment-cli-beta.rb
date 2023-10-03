require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3752.0.0-darwin-x64.tar.gz"
    sha256 "034e292dc08e365abf02ca41195c358fde015224d21d02580ff7e2829b867062"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3752.0.0-darwin-arm64.tar.gz"
      sha256 "8ffaea30ed9a675ede9a93e03add4ee011101c5133506a78909d60778b1df244"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3752.0.0-linux-x64.tar.gz"
    sha256 "4c9377ad000499216bfdbaf2583b71e120b3ed6a61c7f6a0a8306611540e687c"
  end
  version "3752.0.0"
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
