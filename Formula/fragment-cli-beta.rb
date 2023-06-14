require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2848.0.0-darwin-x64.tar.gz"
    sha256 "ee6f41cafe70cfee4c2236e688469616683f6ad90003369c3fa0d43fbb1ca53c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2848.0.0-darwin-arm64.tar.gz"
      sha256 "8cb88b119144b38f2d8fdd9a80311226f837680aaf78ec082e1a71b9e31ef479"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2848.0.0-linux-x64.tar.gz"
    sha256 "7c86961f464e34a8a1aa9a12817f4ab570863ae012c2acde813b39cc1daadde8"
  end
  version "2848.0.0"
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
