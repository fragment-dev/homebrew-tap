require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2527.0.0-darwin-x64.tar.gz"
    sha256 "c28d713baef5985254f19c3bd86fc00035da1a474e34d5c632577fa4d4b567c1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2527.0.0-darwin-arm64.tar.gz"
      sha256 "81be9709644eaedb682c6f00afe256bc200bd92c57628b3881c509821216873f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2527.0.0-linux-x64.tar.gz"
    sha256 "1098438cca876c95844483f8eb6f249c45dd32a60a1723b703c09fc673f70115"
  end
  version "2527.0.0"
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
