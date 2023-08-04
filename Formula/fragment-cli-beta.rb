require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3234.0.0-darwin-x64.tar.gz"
    sha256 "ea2b4be1d4a669447ef9508d079033575e410dcaa6e3184effb980d2fbc735b2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3234.0.0-darwin-arm64.tar.gz"
      sha256 "a8b8452142dfa9dcc2ede4f88008cf301c93af0715b97f7576f6111e5e1d81bc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3234.0.0-linux-x64.tar.gz"
    sha256 "8b3208141363816b327a10bd70a3f17328f2310d1ab3c8baca9845059231b5f8"
  end
  version "3234.0.0"
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
