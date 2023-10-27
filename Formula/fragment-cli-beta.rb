require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3922.0.0-darwin-x64.tar.gz"
    sha256 "83c5212285699f58fd71a63bd49685c49f8031f1161f7b00e1a6702fcc2583f2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3922.0.0-darwin-arm64.tar.gz"
      sha256 "e2be3e75754622fa40b8f5f4e9d2d052ed186c8cbe3149a8dc63c7587c466c12"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3922.0.0-linux-x64.tar.gz"
    sha256 "f0bb226ca6756265d720e869fe22bdf671bae46d1b21646c3348f0117c9fabcb"
  end
  version "3922.0.0"
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
