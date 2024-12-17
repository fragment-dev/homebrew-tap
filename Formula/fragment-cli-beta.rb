require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5906.0.0-darwin-x64.tar.gz"
    sha256 "3e4d6d59f7e3aea63a14edcd08ab579ebb317f0fea91f932da77f0b7e0d9ca15"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5906.0.0-darwin-arm64.tar.gz"
      sha256 "44e2ae71c2bcc9ccb94b8030dcd3fce291cfbbf19419a2a101b12e23c6c1ea26"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5906.0.0-linux-x64.tar.gz"
    sha256 "67ba9e105eac1db740d5259b6ac839bbd5a8aeb5c15f23103d43845da275a36d"
  end
  version "5906.0.0"
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
