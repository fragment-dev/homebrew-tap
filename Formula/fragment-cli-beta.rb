require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3375.0.0-darwin-x64.tar.gz"
    sha256 "d0c56593f10184bb84fddcf9befd7bf13450bc15ea954c1661568b00316cc4ed"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3375.0.0-darwin-arm64.tar.gz"
      sha256 "2ae40975f33ee5491794ae4e14c207336f72cfc8184ce98fb2b68fceb32c64d9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3375.0.0-linux-x64.tar.gz"
    sha256 "dbe02a298706351db3e80432804049f939e5a7f14fbde78bde9af32f1d7a6150"
  end
  version "3375.0.0"
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
