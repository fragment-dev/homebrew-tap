require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4687.0.0-darwin-x64.tar.gz"
    sha256 "7cd7968b099615413916eae4b756224be3d7714167dcad20c73bfd942cb49cfb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4687.0.0-darwin-arm64.tar.gz"
      sha256 "c908165590c94edb310d5570a3a91271b0d14231dcb52603e6c9c1477d2e2806"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4687.0.0-linux-x64.tar.gz"
    sha256 "a55f5eee71e781ac252dd486fcf68ee2d75dd0cda5a1f8f0bd800825c1bb80ea"
  end
  version "4687.0.0"
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
