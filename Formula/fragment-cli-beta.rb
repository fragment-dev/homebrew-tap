require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6035.0.0-darwin-x64.tar.gz"
    sha256 "548c620a40c59967a67684def5945a80181a75055d11a64a29a4d194a8a8d785"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6035.0.0-darwin-arm64.tar.gz"
      sha256 "c08ca6816d0699a1d5cc4f548aabeb61cc5329670331e2c746dd0fdb2c047d71"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6035.0.0-linux-x64.tar.gz"
    sha256 "ad5cfe87ec6bea194f6d6aa4819a63dc7e383940db93d1ab6e4e76952e755f37"
  end
  version "6035.0.0"
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
