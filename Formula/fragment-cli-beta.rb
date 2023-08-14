require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3298.0.0-darwin-x64.tar.gz"
    sha256 "786a9415ace4c2d7069f1de3b9827d0234248a941db0d5f1848e8e3ebf721fb5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3298.0.0-darwin-arm64.tar.gz"
      sha256 "41b3797102f4e77815aa0950c4767c292d816592ab876cd80a8c9041b2da7e20"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3298.0.0-linux-x64.tar.gz"
    sha256 "1a3a3b89c0fa7ec866e8a5380f1ac067842a586761d7bd54abc0024c9c59cc77"
  end
  version "3298.0.0"
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
