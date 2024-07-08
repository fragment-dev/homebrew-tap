require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5356.0.0-darwin-x64.tar.gz"
    sha256 "5ab741362c26a075151dc1468c36d0806cff0aaefb358e7f3d9c880b924af92a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5356.0.0-darwin-arm64.tar.gz"
      sha256 "0fa23743b876a7b19a096d8205fb47a0dbd2550331caa0fbb03ed0a21acea0d0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5356.0.0-linux-x64.tar.gz"
    sha256 "6cfe968b1ae679d43a8a3fc8031532cdcb8151cac72026d5fd45ace1960c41fd"
  end
  version "5356.0.0"
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
