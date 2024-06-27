require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5321.0.0-darwin-x64.tar.gz"
    sha256 "672fa0eb5a783e50a37bc25271236cc279e206facb4fb5177028959f47a9c4c9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5321.0.0-darwin-arm64.tar.gz"
      sha256 "87cc94c04c0983d844c3dec4d0a18b09f5dfc6f3cd6e60fcc9e266e3d0a23544"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5321.0.0-linux-x64.tar.gz"
    sha256 "e4edef271fd41e761b7b0f061144dbf3566b67301c0be537dd6b0fb613db72ce"
  end
  version "5321.0.0"
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
