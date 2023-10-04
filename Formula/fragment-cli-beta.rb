require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3766.0.0-darwin-x64.tar.gz"
    sha256 "d0dc2e396b9a032caef7c0010d735576b85e99a286ea1e0b1b603bed91018c22"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3766.0.0-darwin-arm64.tar.gz"
      sha256 "aa186bf1e18b35f453f8cc139ef55a147036a8d154991ba57b08c3bf32ae8782"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3766.0.0-linux-x64.tar.gz"
    sha256 "c9133524a3fd25b529bab6ee7a4a9d60c1baddf13ff9b1c01af82cba5a6e13d0"
  end
  version "3766.0.0"
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
