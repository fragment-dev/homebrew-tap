require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4467.0.0-darwin-x64.tar.gz"
    sha256 "3abe92a205915cb5927e3e1716f3977a6cace09cc2373956d484e18b5b8e2534"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4467.0.0-darwin-arm64.tar.gz"
      sha256 "457d4a8ebeafba41fd5ae50acd2e6dd352b92e550f22b6c959dd801977cb134f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4467.0.0-linux-x64.tar.gz"
    sha256 "2bb7cc636397727a36fcf810e0adb3a77076a3cb9cb87dee64d6ca4f0e7bbcad"
  end
  version "4467.0.0"
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
