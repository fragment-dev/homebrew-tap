require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3335.0.0-darwin-x64.tar.gz"
    sha256 "ef60c73c42ffc49acedb5e21aecc943304da044477d14ae70dcdad193cbe6e71"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3335.0.0-darwin-arm64.tar.gz"
      sha256 "a34cb3431470661c79a01496f1aa50a57fb9841c2a02ea15b43e45850b19b8bf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3335.0.0-linux-x64.tar.gz"
    sha256 "bfec8f563c2805c31432333222188969ea9dea2abf15a2aa588c000a610a516b"
  end
  version "3335.0.0"
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
