require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5582.0.0-darwin-x64.tar.gz"
    sha256 "d638e7c7ec4e51feb4994bc84f157f82c1400a7807a927657cf20967dae94030"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5582.0.0-darwin-arm64.tar.gz"
      sha256 "ffff48ac094772585dc91e60826599813459a94fdf7a919ee8b02a845b63a71c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5582.0.0-linux-x64.tar.gz"
    sha256 "95aa28aceb89ab0715e2114839b8a9fba6b250f76cf96fb4f08d129b50677668"
  end
  version "5582.0.0"
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
