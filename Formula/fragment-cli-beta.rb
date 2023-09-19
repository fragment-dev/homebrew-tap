require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3614.0.0-darwin-x64.tar.gz"
    sha256 "c688357e801fee5d7e9d3e72f9262f12e95ba27fa8989a4882d07bf13db44adb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3614.0.0-darwin-arm64.tar.gz"
      sha256 "bc75c0eafa48f9e8e898978d7b69880564e2616c0def53b19027986d432d2cb0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3614.0.0-linux-x64.tar.gz"
    sha256 "e8b22ba8e01ab9ef4d25221ae97602fa1f066788ec991c21753264ab4bd26789"
  end
  version "3614.0.0"
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
