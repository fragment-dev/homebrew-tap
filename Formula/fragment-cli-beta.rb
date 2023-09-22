require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3650.0.0-darwin-x64.tar.gz"
    sha256 "7e0eceeee15713ef28ee09d66cde5a61d5c3d3a1001a07e3fc534f84e984fa55"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3650.0.0-darwin-arm64.tar.gz"
      sha256 "04c284d335fc33e2368ba691ec30030ef78d38409169f50bb8c591f6db9bd4f0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3650.0.0-linux-x64.tar.gz"
    sha256 "f307eb51d6f632c0241f75522344949aee04e5384f3275b742f3552e31c22967"
  end
  version "3650.0.0"
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
