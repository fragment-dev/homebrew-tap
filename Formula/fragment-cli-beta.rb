require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5648.0.0-darwin-x64.tar.gz"
    sha256 "20be463cbb8731585f2cd8baed3373c15a132299866fbb5296709d9116255a19"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5648.0.0-darwin-arm64.tar.gz"
      sha256 "a028319babd8ad361fbac87d8e6935f0e969ce169337dd9366c952ed9741f903"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5648.0.0-linux-x64.tar.gz"
    sha256 "0d95b6745b04b0473f08e44e9021d384643bdd169c3929ecb87173482a22f2cd"
  end
  version "5648.0.0"
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
