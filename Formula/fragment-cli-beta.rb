require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5854.0.0-darwin-x64.tar.gz"
    sha256 "e686af5f2556a59404bb70057989630df0484e225a062e7d1ff4c22bf2eac1d9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5854.0.0-darwin-arm64.tar.gz"
      sha256 "cf93933919e5be8327de1abe68aa5fc7a0edb12997be0d602dcafa61fb3179f7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5854.0.0-linux-x64.tar.gz"
    sha256 "b997bb4a372e2bb8fc44714cd205b15f90329c6da955e3387e08f4f6cbc14379"
  end
  version "5854.0.0"
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
