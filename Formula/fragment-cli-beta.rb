require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4209.0.0-darwin-x64.tar.gz"
    sha256 "ec23d0102226fab29b3eb389a8a13beeebc5cdaa1b015848ebb5d6679c6a5c40"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4209.0.0-darwin-arm64.tar.gz"
      sha256 "b18b9bcef693388ba608ca26de4bf8999905ec8b50eeecab36432dc761de5ef6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4209.0.0-linux-x64.tar.gz"
    sha256 "d6f6a05842e2d1af2d80baf1fdcbd9b526227b6dddce600aa04f31726056c863"
  end
  version "4209.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
