require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2665.0.0-darwin-x64.tar.gz"
    sha256 "41cabab41893d97a4d3226866092aa15ccc4ae8a4231e04ffdccfb65958d4e79"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2665.0.0-darwin-arm64.tar.gz"
      sha256 "be973a56a7064b7bd5604ac35a42e04d4182551942940896d26d6ebfd664753d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2665.0.0-linux-x64.tar.gz"
    sha256 "884f367f31474bf89ff74dcd8a4cba4eb4b3995b50e04583ed7673504e92ec37"
  end
  version "2665.0.0"
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
