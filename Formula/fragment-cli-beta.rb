require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3092.0.0-darwin-x64.tar.gz"
    sha256 "d76e2e58ba6212dca9c7f41f6bb9d4086a4a5268d1541dfd054bd0dc289ba5d7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3092.0.0-darwin-arm64.tar.gz"
      sha256 "a7a8cd571d5a1caaca6c8af1878c4c88b14a53f99e35a9d867a86934ecfb4210"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3092.0.0-linux-x64.tar.gz"
    sha256 "56cc781620e841cbcec16d8e64275f82df05b4637d4b644934cdd3bdda288db0"
  end
  version "3092.0.0"
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
