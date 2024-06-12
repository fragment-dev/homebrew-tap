require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5261.0.0-darwin-x64.tar.gz"
    sha256 "f8b89c950ba2939036cb56ac24f3e7870536d893460dfba8aa0db6f2b0fa8cb9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5261.0.0-darwin-arm64.tar.gz"
      sha256 "7181c733d501b87129ba6238613446dff5af18cddb6abee0bea95b90194e3211"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5261.0.0-linux-x64.tar.gz"
    sha256 "d8f1fc932f34ef21f2fedc0426b62ade4011a4c473dbd93549dde5178e128b6b"
  end
  version "5261.0.0"
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
