require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4762.0.0-darwin-x64.tar.gz"
    sha256 "38b5a07a0b96334e0b8ae56f46f376ebdfbf327903eee6afebf579129d7a2ad6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4762.0.0-darwin-arm64.tar.gz"
      sha256 "a34eeb6d2fda82f5202b79f44df8694b73f9f9cb8f741173e8ad6568820ae922"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4762.0.0-linux-x64.tar.gz"
    sha256 "485099fac863a8151c036e761c22e56e52add33d0c1963bda508abe5e79f951b"
  end
  version "4762.0.0"
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
