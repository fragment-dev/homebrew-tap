require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5800.0.0-darwin-x64.tar.gz"
    sha256 "2a1623de81f261808d55eadf4b8cec67c58a90126f23a51c1f87acc9ef4de1a6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5800.0.0-darwin-arm64.tar.gz"
      sha256 "25d8a2b43eb8753d3af051ed0b481c54f7bd4a5953c70f54a6871f082332219e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5800.0.0-linux-x64.tar.gz"
    sha256 "05143c6ebdd00d086946de3e8903ce980a69d1d9fd40e861685b5d7a7cc8410f"
  end
  version "5800.0.0"
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
