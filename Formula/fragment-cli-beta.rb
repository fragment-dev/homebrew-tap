require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5423.0.0-darwin-x64.tar.gz"
    sha256 "43ab69bcfef782c4e108e3e8579adae45e84755b6d0c4ee9d58d9175dd198f15"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5423.0.0-darwin-arm64.tar.gz"
      sha256 "c556903e98dfb25f8dc781c02e10efb778b1e03f0f80922cb17edebb1c5f2a9d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5423.0.0-linux-x64.tar.gz"
    sha256 "d3f6cbe3900ee0f95b9091158c373aacaeaa80094186a9bb18ce310750fc4631"
  end
  version "5423.0.0"
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
