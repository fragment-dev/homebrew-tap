require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2592.0.0-darwin-x64.tar.gz"
    sha256 "288de76077659dd87a2cd7217b470609900a8202a0a280cf61890d870a31a237"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2592.0.0-darwin-arm64.tar.gz"
      sha256 "c8734aa9dde5de9b0e64d7c500c555158be367873b5c9181614aeebd0dbbf10d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2592.0.0-linux-x64.tar.gz"
    sha256 "19adce94432d64e1aab4f14b1fd9eaacc9a3bf6c17b506a9af2ab946d8ac3f88"
  end
  version "2592.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
