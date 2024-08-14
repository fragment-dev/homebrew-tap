require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5507.0.0-darwin-x64.tar.gz"
    sha256 "4d1327aa571c2615fde30bd3a2774479d43da0be528fa86d7f05df20d7844e8c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5507.0.0-darwin-arm64.tar.gz"
      sha256 "bca178c9bb994454c1ec241fcb29151b27ae60ab2b01732f4076480bc637b245"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5507.0.0-linux-x64.tar.gz"
    sha256 "cfd98c7ec9b7a62ab05810802a7bb50f829f3c2ff8368e925168c452fb4edf56"
  end
  version "5507.0.0"
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
