require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3706.0.0-darwin-x64.tar.gz"
    sha256 "63be8847b00bf9c40c1ef2fde5d2b1395b5de518bc046e618d1ff68b169f3afa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3706.0.0-darwin-arm64.tar.gz"
      sha256 "fb761136eefa5b5fdb80b2ba65932b72e5c520b896309196121e69ec989e96fb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3706.0.0-linux-x64.tar.gz"
    sha256 "b609ddf82960ca51bfded3524ed9a682559ae950e5180d7967edd6bf376f392d"
  end
  version "3706.0.0"
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
