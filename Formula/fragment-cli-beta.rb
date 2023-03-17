require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2236.0.0-darwin-x64.tar.gz"
    sha256 "9c050c172cbb8cc1dc980e878c2a13eaaa77bca0066f9efc2ef926514c4ddf7a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2236.0.0-darwin-arm64.tar.gz"
      sha256 "3c5eb091e36c2bcb0bccf3c94d67ccdfabe72179c91a798613acc86ce20f8de9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2236.0.0-linux-x64.tar.gz"
    sha256 "00b62509aa0f2eebd6fb03764f098a4ec6e4982ffef340c0dfdf8bc0aa606708"
  end
  version "2236.0.0"
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
