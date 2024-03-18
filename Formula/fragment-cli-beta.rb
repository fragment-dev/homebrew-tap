require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4779.0.0-darwin-x64.tar.gz"
    sha256 "ac6a9160c1850d0f16ef4ff059e57ac9381cce6c82fae9841812350f384cf607"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4779.0.0-darwin-arm64.tar.gz"
      sha256 "f087fa92b8ca506fd0728592ff1cfe7288120552b05cf609dc2861d39b637b0e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4779.0.0-linux-x64.tar.gz"
    sha256 "d2a315aa163efb4d3b96368900faa1431f3b66e067e87457bb5fc6e43546914b"
  end
  version "4779.0.0"
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
