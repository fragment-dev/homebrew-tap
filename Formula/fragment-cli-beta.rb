require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5454.0.0-darwin-x64.tar.gz"
    sha256 "0503177df3e1038e7824cd8da044eb2a7cd469b1be5e427438206e0275ebf038"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5454.0.0-darwin-arm64.tar.gz"
      sha256 "ce41cafbb48f6ca4012bdb4f0bf1c46532d34618fcc4ad5af2f9ec82523100ae"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5454.0.0-linux-x64.tar.gz"
    sha256 "f97c5818960a2e3de8a3f150f028467f2f7b5326bb828451a7ba100762e4d55d"
  end
  version "5454.0.0"
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
