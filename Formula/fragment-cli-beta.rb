require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4359.0.0-darwin-x64.tar.gz"
    sha256 "4d8affc8b0080c921d19f0cfb888722723b09d0b15691949b5e5d2db03a54aec"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4359.0.0-darwin-arm64.tar.gz"
      sha256 "9a38b460d7556418a2c7a8a652e5cb85750fa5a5f9a651deadeda96fd18bb2b6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4359.0.0-linux-x64.tar.gz"
    sha256 "98146ac3839e3f4e147d3429e068aefadbb015d6b8ab2828ab87d31e30ab30f2"
  end
  version "4359.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
