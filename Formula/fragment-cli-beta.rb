require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3919.0.0-darwin-x64.tar.gz"
    sha256 "1470421b070e11e9af528a2326417a4961f2c6811ef55d07484a12e5745785c4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3919.0.0-darwin-arm64.tar.gz"
      sha256 "b8e1b95019ba5b941cac512822e98af2f4bec021714420a9947a1a017f3941d3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3919.0.0-linux-x64.tar.gz"
    sha256 "d8fd7ce709346e62253fe300c672a21881c558b16d74fcb0994a269c8ebf571b"
  end
  version "3919.0.0"
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
