require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3704.0.0-darwin-x64.tar.gz"
    sha256 "bba7955bb8e1e445c481442254a7548931bb002b77669f20e9db104409e22d60"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3704.0.0-darwin-arm64.tar.gz"
      sha256 "fac8240563c8718ce67790321d5bdd77163855d3f6ac61fe7a98df9edeea5542"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3704.0.0-linux-x64.tar.gz"
    sha256 "9a806285443942cffc8cb99f8156203d71d6dae5463dc87ebaff585ffa68d98b"
  end
  version "3704.0.0"
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
