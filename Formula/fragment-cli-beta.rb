require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4365.0.0-darwin-x64.tar.gz"
    sha256 "f660c1a1a0693cb3254e20560d1c8afd236e49ebc82f6a204e5a093bb0a5d6bf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4365.0.0-darwin-arm64.tar.gz"
      sha256 "30b8b759c606cc1c12532bd5b86ceb6bc5d87deaba5011a51988d46ef9666da1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4365.0.0-linux-x64.tar.gz"
    sha256 "890ab2db613226c408b2c6e5d312d3b04262f7e2996bb59f717043ea6500f484"
  end
  version "4365.0.0"
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
