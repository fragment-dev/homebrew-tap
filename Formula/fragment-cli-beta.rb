require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3267.0.0-darwin-x64.tar.gz"
    sha256 "095b7d7bd660323c2b91654b582fb353d2e9c4f16e86cf63d10b980c3142356b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3267.0.0-darwin-arm64.tar.gz"
      sha256 "5556d9890c9e85843d3103aa9466c15fc7bd9e29a3cfe67b614e2c7a592f1b54"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3267.0.0-linux-x64.tar.gz"
    sha256 "5049f52179e3a15ac5c41c974bee1e07f7ed68b2ddaef9155108a7be9a968548"
  end
  version "3267.0.0"
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
