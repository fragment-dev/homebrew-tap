require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6072.0.0-darwin-x64.tar.gz"
    sha256 "b493fcf861122ee4a9b9b48c7e13852ab7562ff71ec22d5277716e759b5aaeb0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6072.0.0-darwin-arm64.tar.gz"
      sha256 "1a7fd59a6f398036d1e5bd42322974255a97cde3581a62310ca50a8588403cc6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6072.0.0-linux-x64.tar.gz"
    sha256 "680d0edf14f6ae5e3056f99e80becafedfb96f4c92077268777689a8192b5e48"
  end
  version "6072.0.0"
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
