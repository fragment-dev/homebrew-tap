require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3038.0.0-darwin-x64.tar.gz"
    sha256 "ca9cb68bebffd76727e768eb655ebe34b723b27cf18833fd30fbe419e1511522"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3038.0.0-darwin-arm64.tar.gz"
      sha256 "6a06b7d47e279f65a9ecf375535d1d3c3eecae64c484a4ad97a7cffaa046e299"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3038.0.0-linux-x64.tar.gz"
    sha256 "5d9e34c2992b31c5fb3c8a60d531f4ac6533a6dd0ca861205e7c94a0ac63afeb"
  end
  version "3038.0.0"
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
