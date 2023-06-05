require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2797.0.0-darwin-x64.tar.gz"
    sha256 "cf3016673b63ae3aa0cc68de18bd786204c919bfa52b3e62d37f286958b6dd76"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2797.0.0-darwin-arm64.tar.gz"
      sha256 "00acca20e7e25d957b15278cd761efc21f30171b50184ee090f8227d5c8b1c92"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2797.0.0-linux-x64.tar.gz"
    sha256 "d8986386780b5d03420f5df142d0c9c0ecb0ccdd867d3141904877127052a283"
  end
  version "2797.0.0"
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
