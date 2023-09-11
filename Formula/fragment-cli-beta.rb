require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3515.0.0-darwin-x64.tar.gz"
    sha256 "57aa3c51ceba3eed59745f5f3c6f57b318ea8dcac824250f91ea3cc5eeac91b3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3515.0.0-darwin-arm64.tar.gz"
      sha256 "dab4fefa4c5969a1cbdc229e46597098043cce9b648f88fe4eb94fb34cefa0ff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3515.0.0-linux-x64.tar.gz"
    sha256 "a23965ee51c1ecebbf20659936744bc6cff20696843276d6662a690434a4fa49"
  end
  version "3515.0.0"
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
