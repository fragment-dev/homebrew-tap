require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3058.0.0-darwin-x64.tar.gz"
    sha256 "f67d62b49dab73d947cb34d04bc57637fcbd5fe620a42e9577ded71ae0b4b915"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3058.0.0-darwin-arm64.tar.gz"
      sha256 "d33c2f2a1d27deff1bb774680143aa822d45e2cdf09006071aebf92caeaaa4ee"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3058.0.0-linux-x64.tar.gz"
    sha256 "3b3f389227e0103dc229afdcd017e417147e6b708fd16a96abb8920a5179b9b6"
  end
  version "3058.0.0"
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
