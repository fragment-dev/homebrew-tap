require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4337.0.0-darwin-x64.tar.gz"
    sha256 "d1d14ab0b5ed4637ba3bd96b065328b7a65f8e90d30650dcffa3eb7de6b17c22"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4337.0.0-darwin-arm64.tar.gz"
      sha256 "33d8e9e77f402d67967abc48cc23c4066ec349f305a620e4c3f569c51e271eb1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4337.0.0-linux-x64.tar.gz"
    sha256 "663fb19442bfff0d1b299e948a469c22be88cbd5647bb79310d7e5aa9d9beb32"
  end
  version "4337.0.0"
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
