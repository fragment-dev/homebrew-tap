require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5666.0.0-darwin-x64.tar.gz"
    sha256 "2f70ac12231363304e29906f001dc8730aab2bb921b9cf60ad6600f0b515a388"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5666.0.0-darwin-arm64.tar.gz"
      sha256 "6f4a2cc8a8ef22630cc1f7b58d2a868329a840f9b445d7a6c3cbe2b154d49559"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5666.0.0-linux-x64.tar.gz"
    sha256 "59db1e4a00d5ac6751a5192ff9b15314df06f4977c52b1f11a24321aeae9be23"
  end
  version "5666.0.0"
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
