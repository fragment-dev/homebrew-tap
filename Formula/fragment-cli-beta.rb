require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4780.0.0-darwin-x64.tar.gz"
    sha256 "86c212b7f209db3cc28bb742efbbe5635a2c968fb2ccc3f6a28d4d7c571111ae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4780.0.0-darwin-arm64.tar.gz"
      sha256 "a166cb6cb370518c64d8d996b9a8bf592fe838ba114291fdb5fa5c22f16c0a30"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4780.0.0-linux-x64.tar.gz"
    sha256 "d538e420f7708c2f8d6eb30a67c4bab85051ae235ffe5b2e78ef199fce904cfd"
  end
  version "4780.0.0"
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
