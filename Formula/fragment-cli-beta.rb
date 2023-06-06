require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2801.0.0-darwin-x64.tar.gz"
    sha256 "398e36d2f05721a53e3a3d9754272473e6e928e9f520630e9eeb7abd114c0f50"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2801.0.0-darwin-arm64.tar.gz"
      sha256 "244e99722559c3258fb6d2232ee2a8f062c6842eb9850e231012b5eee4c00573"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2801.0.0-linux-x64.tar.gz"
    sha256 "80aea6c9fe4d740a506551db2ead6d9e6f986f5a03f461a1dac96e6b68a6dfad"
  end
  version "2801.0.0"
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
