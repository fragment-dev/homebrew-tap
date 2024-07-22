require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5426.0.0-darwin-x64.tar.gz"
    sha256 "5d4fcb83fab43ef7507252ace4286a1c396b73c4bc1b46cbf4ecc6c115ba5dc1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5426.0.0-darwin-arm64.tar.gz"
      sha256 "92191bdafc038c77b9bbb1d45b666bdc54688f49d578279a8cf398528a0188c6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5426.0.0-linux-x64.tar.gz"
    sha256 "c53eb54a46c9037434f94cbe21e2ad3c08197ea5d658ef9a5a3383dd5dd53caf"
  end
  version "5426.0.0"
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
