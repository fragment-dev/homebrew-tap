require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4815.0.0-darwin-x64.tar.gz"
    sha256 "c446865b94f0dd5d173dfd055b513eef4f34dce6915dead233a823649965589a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4815.0.0-darwin-arm64.tar.gz"
      sha256 "da753c4ca481db0268661e46190b265f1720102862a3ed980d53fbaa9afed4ce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4815.0.0-linux-x64.tar.gz"
    sha256 "09728e4971353cbf10aca99ba344ca840a26b2acc8a21a495111d3b5367aa944"
  end
  version "4815.0.0"
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
