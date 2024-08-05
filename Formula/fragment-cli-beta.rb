require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5467.0.0-darwin-x64.tar.gz"
    sha256 "d01b2da0d0a8b42662dc22a222f8b2d65af5cfb8aef5d118f7b21cd278a7a9fc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5467.0.0-darwin-arm64.tar.gz"
      sha256 "2a1e56d1e651d154e8b625c40fe4f003b7970027059165dd47dadea1a4e95f9c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5467.0.0-linux-x64.tar.gz"
    sha256 "9520ffae628dbc69776051c831ab426c788f33754505b7943691786e76fe8cd5"
  end
  version "5467.0.0"
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
