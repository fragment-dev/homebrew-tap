require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6031.0.0-darwin-x64.tar.gz"
    sha256 "eb56833e004b523b8e0119fbae7b9cc0328bec876f8a9560ef0d5cbe3594be30"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6031.0.0-darwin-arm64.tar.gz"
      sha256 "d129250e9314ee5bce4126e004f63e42ee580430c7c9cd064da303f804d1bfe4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6031.0.0-linux-x64.tar.gz"
    sha256 "8f7d01d0ef1865a462ac7e90edade0ebb268e142d35a5c1e6c942c2d165f45ed"
  end
  version "6031.0.0"
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
