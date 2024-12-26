require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5988.0.0-darwin-x64.tar.gz"
    sha256 "85532ab43d2f241ab99e5c03c9d46f337dad9301dbd2e1ecf859ef2063f6fdbd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5988.0.0-darwin-arm64.tar.gz"
      sha256 "2bb3bf54292d767f6934670e9f527879ffab15a59fdab24df4cdf864b9ef02e2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5988.0.0-linux-x64.tar.gz"
    sha256 "c84476b34bc8ca8872a2e1c6db3728dbf78042248169efeabc8398eb97aa0237"
  end
  version "5988.0.0"
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
