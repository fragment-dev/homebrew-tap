require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2772.0.0-darwin-x64.tar.gz"
    sha256 "15526487f023d14dc1f085e80d3d148f953e1b86c572492e2b9e35033f66fc22"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2772.0.0-darwin-arm64.tar.gz"
      sha256 "0b2934c42ba2bb864ed285c87553a59e7b90d9c452cb8d1af7c1f01601490383"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2772.0.0-linux-x64.tar.gz"
    sha256 "2d262db41fc2475edb86988299f40891b3a4e2fe120e002cc1aa40a8e6aa0bc7"
  end
  version "2772.0.0"
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
