require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3980.0.0-darwin-x64.tar.gz"
    sha256 "727fc5c01b8e6504be9f3c42f14b18aa019bf171eefca5a31072ddbca1fad8f6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3980.0.0-darwin-arm64.tar.gz"
      sha256 "29828f775a593f36a8a007768c661d652ea9821bdaf35d800a812e4a4a81dad1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3980.0.0-linux-x64.tar.gz"
    sha256 "3c2896ca38b73398324d5d1b437fdac3f7690d382fd1b50a40a7521835e7805b"
  end
  version "3980.0.0"
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
