require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4954.0.0-darwin-x64.tar.gz"
    sha256 "88db17ae1a33afa3617d6d6f0fce7ecdd65164ed7644df6e41ee890ce1f589f5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4954.0.0-darwin-arm64.tar.gz"
      sha256 "a1cae1c3e95c94e6658c30e91211f794fcad4781b024286286f3cce94caf968c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4954.0.0-linux-x64.tar.gz"
    sha256 "cf1267d85f3a0c04cab3dc9e3311af711188764e960ea57619de1831417af3aa"
  end
  version "4954.0.0"
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
