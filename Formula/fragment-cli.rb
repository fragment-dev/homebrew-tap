require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.1-darwin-x64.tar.gz"
    sha256 "17b7f44606d7ed65f0b12ad615a58fa3dc021b5e35863e170560d82e20133320"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.1-darwin-arm64.tar.gz"
      sha256 "2786666e754de91aefc1d36ba936780f2279b80740f184b84e7a1ea0af59890c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.1-linux-x64.tar.gz"
    sha256 "33ee0b2a30be4b51a767d4b325a2f25debd806b962a82baee55591cc2516f26d"
  end
  version "2025.1.1"
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
