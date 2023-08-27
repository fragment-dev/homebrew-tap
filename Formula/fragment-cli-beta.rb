require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3398.0.0-darwin-x64.tar.gz"
    sha256 "9bbf1427a998e8628090c16f6b7cea359c78920e77c7e6b57e004c2e492a3de4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3398.0.0-darwin-arm64.tar.gz"
      sha256 "c898e8485928025a271478851790cc4ead10039e706b75d1fc343ff4c8dfb4ed"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3398.0.0-linux-x64.tar.gz"
    sha256 "5aa9ec97b5b2a881a770ea60378695f5069a92f72be9902a9d2e070a8886cd6c"
  end
  version "3398.0.0"
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
