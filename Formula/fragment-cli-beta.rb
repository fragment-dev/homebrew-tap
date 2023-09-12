require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3541.0.0-darwin-x64.tar.gz"
    sha256 "3f742af19ccb28588636e6bee1a1fb0ae8a44b0b181228dbc19b624709565049"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3541.0.0-darwin-arm64.tar.gz"
      sha256 "49c1fbc87367fdd74c18fffac20f6fb1d4898d94760b6924850204881efe63eb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3541.0.0-linux-x64.tar.gz"
    sha256 "374d7b289049948569e1f90a583e99d56238af0af3f4fd9b1e37c42f3ec51a8a"
  end
  version "3541.0.0"
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
