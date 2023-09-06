require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3491.0.0-darwin-x64.tar.gz"
    sha256 "942e65897d1d00303ede6bd4716863ae4f1b267d58c9c9e16b16da0ef7239980"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3491.0.0-darwin-arm64.tar.gz"
      sha256 "cd21fee575da3064156e8c266024ba2695ca55aad14752657ee26e7ee9e27300"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3491.0.0-linux-x64.tar.gz"
    sha256 "a859fa95714d5122c020bcd23528a478c25f5df9b426f7fa0c24524d2be65595"
  end
  version "3491.0.0"
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
