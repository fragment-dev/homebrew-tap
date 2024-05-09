require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5014.0.0-darwin-x64.tar.gz"
    sha256 "4f71938661db5a12c8ad4abb2ffb4ce507b0c6823aec807f98bb9e37737f8eb7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5014.0.0-darwin-arm64.tar.gz"
      sha256 "b0004d8ebfaf194370f477512fcbf84edadeeb11cbf3c3a7f33558fa0b2a0bb2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5014.0.0-linux-x64.tar.gz"
    sha256 "a79f55c5e1d8b59027371f88e5b8761ff3e5891f610769b2712266a6a8503f28"
  end
  version "5014.0.0"
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
