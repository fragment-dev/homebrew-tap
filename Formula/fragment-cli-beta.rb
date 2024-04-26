require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4957.0.0-darwin-x64.tar.gz"
    sha256 "585438295eae7b01bccb75bbacd2004a2e8a7e93a133ecc0ec12c6a4e2550ddd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4957.0.0-darwin-arm64.tar.gz"
      sha256 "5346db30d854a7f0bb0af1a27a688deaf1f0f8cfc2fafa11d2293a852a62c443"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4957.0.0-linux-x64.tar.gz"
    sha256 "eacb925c04efdcd97bb3ee81e15a1f241470cafc12ba94777561b5b58ec522e2"
  end
  version "4957.0.0"
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
