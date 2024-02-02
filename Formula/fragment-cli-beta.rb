require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4482.0.0-darwin-x64.tar.gz"
    sha256 "0bd59cb5dee6453bdf6dc27b001395556466370406bad349c593e636d664a114"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4482.0.0-darwin-arm64.tar.gz"
      sha256 "a3b6331f00558ac7b1ba46834de9ec5db7c9fb1f40010e4549b1a659b874e888"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4482.0.0-linux-x64.tar.gz"
    sha256 "9558ea54196260a1b7f3f2850bdafc97ab625d0726e61b60fb9b0624d376b891"
  end
  version "4482.0.0"
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
