require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5742.0.0-darwin-x64.tar.gz"
    sha256 "8645cfdf3fc4cc8e1f201687acc7d6067247a4a17be39a990902c581ef837a7c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5742.0.0-darwin-arm64.tar.gz"
      sha256 "e814551249556afd7ca5b7ba4ebee87acca94044f9e30595d280a5fa116c4d80"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5742.0.0-linux-x64.tar.gz"
    sha256 "5321d7d62840116a782d3b04e393d03010d5ff28e6315c9e9520f2f4af60f2ae"
  end
  version "5742.0.0"
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
