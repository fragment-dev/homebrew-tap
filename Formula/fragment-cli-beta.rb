require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5861.0.0-darwin-x64.tar.gz"
    sha256 "b407250f6425ecf6db16b8e1ca15c3ce3d2e0b325e6d5ab843752f49cdd3888d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5861.0.0-darwin-arm64.tar.gz"
      sha256 "3a181329dc4717ac0237f647343987314eba6024c4b0d51b63d3610396c7d4c5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5861.0.0-linux-x64.tar.gz"
    sha256 "1f7e5576e6a67626c78562bd81ea38606185da42e8ef8ee9d79bc59996c9a129"
  end
  version "5861.0.0"
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
