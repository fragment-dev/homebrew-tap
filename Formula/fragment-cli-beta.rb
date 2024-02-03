require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4489.0.0-darwin-x64.tar.gz"
    sha256 "27c4b9d18faa00965a752a7ad2a6c6553e41a7a0f5024545cc35ad977b434bb2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4489.0.0-darwin-arm64.tar.gz"
      sha256 "1410cd5c6a5c9065018a41ac599edbe009e5d59c98a99d9aab9118da11d2adbb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4489.0.0-linux-x64.tar.gz"
    sha256 "e98f70273aed59af7e7f5a1da675e19b86f9a9a3b16f2c101e27ae7160fa8cd7"
  end
  version "4489.0.0"
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
