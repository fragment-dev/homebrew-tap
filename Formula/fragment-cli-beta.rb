require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4761.0.0-darwin-x64.tar.gz"
    sha256 "fcf50a5317be1369626753fbfc41168517ae0809e11a1aba56928d70d3ca2a60"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4761.0.0-darwin-arm64.tar.gz"
      sha256 "3db58c7e3d986e7b2d7f31785f5506255af99ac6d5ab94ce0fee09cca970ba2d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4761.0.0-linux-x64.tar.gz"
    sha256 "2c47b20ae0a1345d46285484d7f1dbd60ce05d0185c1ad0136bc7eac015f02c6"
  end
  version "4761.0.0"
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
