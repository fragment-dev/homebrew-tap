require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4119.0.0-darwin-x64.tar.gz"
    sha256 "2c4dd366aa5a0d9c7615931eef2960a85449e9c474b329888dd310d03b15fb1c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4119.0.0-darwin-arm64.tar.gz"
      sha256 "6586d0fce58fc56d9da266e659fe99fdd882f9fc2a07c1a9cafcb517227f01d1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4119.0.0-linux-x64.tar.gz"
    sha256 "e797b76c51dcb7ceef3423c114f43da8f37b8f96b09a2fe3161fd86b73d99c4a"
  end
  version "4119.0.0"
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
