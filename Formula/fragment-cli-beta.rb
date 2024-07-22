require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5425.0.0-darwin-x64.tar.gz"
    sha256 "52567d778d5252f41d9811ec9313a8e15ac5598c1cb5c2b78da06dd3e4fe933c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5425.0.0-darwin-arm64.tar.gz"
      sha256 "53f64ae23e1c1356292eb44555d10f57aa1cac1d99b7ffff3a8c88345fc7b80a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5425.0.0-linux-x64.tar.gz"
    sha256 "ed7332eb85b795303b093ea26afe75e0d4aff520c13caa9ec11fb9bb4b25ce06"
  end
  version "5425.0.0"
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
