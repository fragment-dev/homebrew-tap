require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4430.0.0-darwin-x64.tar.gz"
    sha256 "bd2f4bc20ee7e70e95674fd510ed1e6946d3ec3fa77464d0f167d39a03c38488"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4430.0.0-darwin-arm64.tar.gz"
      sha256 "ec9128882dc8217377fbce495e6d08c37b4e4e03dbf593bb6ed912b304b155ee"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4430.0.0-linux-x64.tar.gz"
    sha256 "b89591f774d6bff21b62e780986ef3aca910808fca0f6f10623cc6a84c292a95"
  end
  version "4430.0.0"
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
