require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5173.0.0-darwin-x64.tar.gz"
    sha256 "8fe47c249494e8c4f54fe4f3569daa8a2de621bf922ea5a36067f8bf8667af23"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5173.0.0-darwin-arm64.tar.gz"
      sha256 "1abf2c2c18f4b2ec8ed46690c8bec23265e6b665560b59f96d1b806e313446c3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5173.0.0-linux-x64.tar.gz"
    sha256 "d1daf6f44c0e86ac9444c91064592f91f2172d8f18c046de99be6bec9e8243e2"
  end
  version "5173.0.0"
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
