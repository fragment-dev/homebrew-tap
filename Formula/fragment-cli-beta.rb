require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3013.0.0-darwin-x64.tar.gz"
    sha256 "5621fe9828e586e200f393a1eaa3cf1d4aef52415ce47c3565f9000e6623e766"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3013.0.0-darwin-arm64.tar.gz"
      sha256 "e5087c93d3dfd1689770f626c8abfd5d8507e7877893a4c175657cf071476600"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3013.0.0-linux-x64.tar.gz"
    sha256 "632f1994742f4aba070ba3fde3be19b6eb21f3144586e7250e47eb4c9dee9f57"
  end
  version "3013.0.0"
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
