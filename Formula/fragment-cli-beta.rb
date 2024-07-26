require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5445.0.0-darwin-x64.tar.gz"
    sha256 "ce513e4cf7b8e22a600aef67567ae9ce01b94c70ac0abb685f44bdf0a0e8e87a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5445.0.0-darwin-arm64.tar.gz"
      sha256 "22ac06537fd01265ed650e4d8663604c851a0976059c1d96df7f13a7168ed653"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5445.0.0-linux-x64.tar.gz"
    sha256 "8a69174f09b27adc824998e1acd98581f4b3fbab0d3e986c32489d9f2212edf4"
  end
  version "5445.0.0"
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
