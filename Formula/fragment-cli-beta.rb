require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5049.0.0-darwin-x64.tar.gz"
    sha256 "09e680f32c25fb044cb131f6b7cbc0ec4e79a0f3f5bff8cadb1e71d382c588c2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5049.0.0-darwin-arm64.tar.gz"
      sha256 "76b14d656b7c6c0954ca200228a65b08334bd3f28b14ed26d6c8254c1da6d8f8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5049.0.0-linux-x64.tar.gz"
    sha256 "7a9972ee3ddcfe9747841878eb5c44e7f5cfe10e8cd4f5dab7f85d3dafae0cf4"
  end
  version "5049.0.0"
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
