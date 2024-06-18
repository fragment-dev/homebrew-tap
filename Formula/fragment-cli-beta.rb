require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5294.0.0-darwin-x64.tar.gz"
    sha256 "bee61e76c1e6113b05252445a38e68f57511bdff93cf18e8bb1ad0b60e646c9f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5294.0.0-darwin-arm64.tar.gz"
      sha256 "eeaaff16aebc1abf446cead0df4729a0c68f7f7fc42d501756cc4072de10ba1b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5294.0.0-linux-x64.tar.gz"
    sha256 "a3d35ce23c423c88233eccffa01c3b4d086aadca68ed4893ff5b8fbd6c6cd7d2"
  end
  version "5294.0.0"
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
