require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4268.0.0-darwin-x64.tar.gz"
    sha256 "cb1fa0442ad54417a106d37f7f2032fe10770681d21a77914d1193d838f10917"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4268.0.0-darwin-arm64.tar.gz"
      sha256 "4123865fd24b00faa27ddcf8d1f299f5d0d7890496853aa528a877f213a69702"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4268.0.0-linux-x64.tar.gz"
    sha256 "6cbb42453b38e96e044a5992be94b491ebe24f915cc653a84682d76c1fc4144f"
  end
  version "4268.0.0"
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
