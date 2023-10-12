require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3809.0.0-darwin-x64.tar.gz"
    sha256 "008f9cd97276fd7d542d8a57333b4399fdd937d6fc25bdb824f872b02c737aa7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3809.0.0-darwin-arm64.tar.gz"
      sha256 "696fcc5b9de455f5d2ee681335b7e817495d5d1e4d697d9b01cfba9bcdc54822"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3809.0.0-linux-x64.tar.gz"
    sha256 "9cb9aa8abe8d3b3b1e0398fb214d087f58d8ded4ada28c9af1dbc409ee5f13e7"
  end
  version "3809.0.0"
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
