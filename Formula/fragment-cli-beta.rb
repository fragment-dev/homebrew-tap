require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3170.0.0-darwin-x64.tar.gz"
    sha256 "799553f3e07cd4392faba7ce73384020e25eb12bb75bd131da42dce275f9621b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3170.0.0-darwin-arm64.tar.gz"
      sha256 "4ea7fff179242e32d0308f1d4f5ba807924656810205e6a0328298c89205e211"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3170.0.0-linux-x64.tar.gz"
    sha256 "3b12d09d7b3feb92804eb6da3849e73bbbbadcc70f448af1c6f7564c22549f98"
  end
  version "3170.0.0"
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
