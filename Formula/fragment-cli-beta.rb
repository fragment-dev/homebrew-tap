require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2658.0.0-darwin-x64.tar.gz"
    sha256 "ac5eb4b784fcf34d7cf78994a93cca35dc630566f0adbcc335d6c10365dd1626"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2658.0.0-darwin-arm64.tar.gz"
      sha256 "140c92c52c4c3caf434a3d2a7647ab6301aec5c56a68f5acb0dad82885f3a160"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2658.0.0-linux-x64.tar.gz"
    sha256 "79689cfabe1c3cf3989ef82a729ce867b11e9aa9c899c5d0d790bf64d9b289e0"
  end
  version "2658.0.0"
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
