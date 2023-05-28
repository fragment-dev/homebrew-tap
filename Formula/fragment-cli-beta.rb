require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2755.0.0-darwin-x64.tar.gz"
    sha256 "e1f28e341bbd952d82f504776823108f8e3e3d59b5f3ab3b73a0d7ac1e9e876c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2755.0.0-darwin-arm64.tar.gz"
      sha256 "f5127a15e0fbf4a454203797abc43612660494214e3126f8c0f2b6389ae2b7cb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2755.0.0-linux-x64.tar.gz"
    sha256 "3a3be05edf6a7255febebad06354f0eb3d5baf919fe8147ce3e70ff9b01aaab8"
  end
  version "2755.0.0"
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
