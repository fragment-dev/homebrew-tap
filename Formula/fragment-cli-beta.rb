require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4835.0.0-darwin-x64.tar.gz"
    sha256 "d3ad2d417feaecb45112296c5939f43198bffffaa3b485514921d043a0861dc1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4835.0.0-darwin-arm64.tar.gz"
      sha256 "30600a3c87d49a59cdde0112a341db9bc694a2b2cab1da1458b81ad8fcb4eccf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4835.0.0-linux-x64.tar.gz"
    sha256 "133021d252d06fbdf4bb85900142b8761dcae3c736007929493c1dbf685d6c79"
  end
  version "4835.0.0"
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
