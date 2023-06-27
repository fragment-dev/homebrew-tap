require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2946.0.0-darwin-x64.tar.gz"
    sha256 "f2dde7c329f8a3501b4dc30210af239cbcaa0032bc3bf79b245f1a03c24b1922"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2946.0.0-darwin-arm64.tar.gz"
      sha256 "5a4248b9dec5e834cfbdff19fa011c1040a64e4cd463d684c103f084f7cff55c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2946.0.0-linux-x64.tar.gz"
    sha256 "c199c4dc9f5a275cd5047bc98b39f20ca2e136d1686b3c48872b19213d4fd9aa"
  end
  version "2946.0.0"
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
