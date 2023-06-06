require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2799.0.0-darwin-x64.tar.gz"
    sha256 "a07c50596c862776b087f89ed14c7e224b4a11efa46a1e7a18759b83b674fea1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2799.0.0-darwin-arm64.tar.gz"
      sha256 "aafc2645cfb9f0de3f49c2de1706e5befbfacb065588c3386db0af9aeca4ad08"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2799.0.0-linux-x64.tar.gz"
    sha256 "e6f929158b7f3cf7a1e330ca0b45cdecbcd6c23c6c0ced92296c368cd0e7544f"
  end
  version "2799.0.0"
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
