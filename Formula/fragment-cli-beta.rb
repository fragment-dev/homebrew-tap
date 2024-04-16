require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4908.0.0-darwin-x64.tar.gz"
    sha256 "87afb1af2532233f6a3311734bf4a7e7150c307aa0711a9184892e4352e47af6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4908.0.0-darwin-arm64.tar.gz"
      sha256 "fab3b0efc2c7fdffb5bbf33dd9566c3da5039e482799ea5dc69b1604b7fecccb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4908.0.0-linux-x64.tar.gz"
    sha256 "326a0f81bfc31aa949f8ee2dda91c49dfc2283c03658dcbcd37d80c41403455a"
  end
  version "4908.0.0"
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
