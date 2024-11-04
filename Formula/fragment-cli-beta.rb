require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5721.0.0-darwin-x64.tar.gz"
    sha256 "3c04ab2764d8a1fbf9230ff51d4dbeafaa92d3286f00b82c588c357fe55a8e05"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5721.0.0-darwin-arm64.tar.gz"
      sha256 "6eb86a37a9e3b4f2d6b273bf51fdcebe049777e9e1854fde66cd81386fee4b4a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5721.0.0-linux-x64.tar.gz"
    sha256 "406822cc0208ef8d1df88797d3a1d204f004ecca73b8b1d5eeda80f9b28f3d81"
  end
  version "5721.0.0"
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
