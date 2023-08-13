require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3297.0.0-darwin-x64.tar.gz"
    sha256 "bc2f14c6b2b84b715f6ae7e859175a1088ad923f6595a3593f017b7e704ba83b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3297.0.0-darwin-arm64.tar.gz"
      sha256 "d732e72b4a37f17a5d3a736fc0387f53fa5bddd2861e0b7ded7834476e37fba4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3297.0.0-linux-x64.tar.gz"
    sha256 "b4c983244b9817c416533b94e35a25ea8869ee395f03ca73af02b71c96936f0d"
  end
  version "3297.0.0"
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
