require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5638.0.0-darwin-x64.tar.gz"
    sha256 "2001e1575a4fedaab0dda8f98d4bb79664dc64414d35ee5f747628e3b9b6365e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5638.0.0-darwin-arm64.tar.gz"
      sha256 "133258ff9167ee8513c99b7b1dcfe0e7330bcc9fafdd7399f7be33e737c48089"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5638.0.0-linux-x64.tar.gz"
    sha256 "bbbfc95e8dc3c52ebb851acb3ac3f76b0c92cadde287f0b32a813c85e48a8c88"
  end
  version "5638.0.0"
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
