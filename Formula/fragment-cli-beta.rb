require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5061.0.0-darwin-x64.tar.gz"
    sha256 "1bf0fdd417853c5b709ddd2f9f09edbbbfa1b25d32a7aec2cd0a35d150f4bb01"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5061.0.0-darwin-arm64.tar.gz"
      sha256 "0cfb9fdb0860045881069fee54ae8475ae4234627a5be08b90249dbe03ac6705"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5061.0.0-linux-x64.tar.gz"
    sha256 "480b1cd88404515e68969c4a4105d37b078c02c9a643dec4e9422f1f58971ecb"
  end
  version "5061.0.0"
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
