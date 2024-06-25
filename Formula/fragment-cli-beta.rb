require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v798.0.0-darwin-x64.tar.gz"
    sha256 "ca98e0029e9c735cc2a1d56c3d3e9ed77ddb57bfcd1fe555c66eaa79597e93d5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v798.0.0-darwin-arm64.tar.gz"
      sha256 "2aea9b4cb9a7f5608872e71df9fda511450dbca346709a43d20aab2dbc9005d9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v798.0.0-linux-x64.tar.gz"
    sha256 "e0a19303321c9ee041a122753149c4df617b18ab530c2e616349b9555a1baa5f"
  end
  version "798.0.0"
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
