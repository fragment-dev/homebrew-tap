require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4759.0.0-darwin-x64.tar.gz"
    sha256 "8f607cbfa69b2b1313f90a4e6b000050f15013fbce86331dbe6aa2bf30e989b3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4759.0.0-darwin-arm64.tar.gz"
      sha256 "5975cb4c28235a359ed97d0f4fc7f787335c8ce93d44d118f86d9ddfa4082580"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4759.0.0-linux-x64.tar.gz"
    sha256 "0159a45ead947b3d9f8aed37d619d9b3bd7c8671be5c763c1bac4d308c419bf7"
  end
  version "4759.0.0"
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
