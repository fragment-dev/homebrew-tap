require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3933.0.0-darwin-x64.tar.gz"
    sha256 "6b9eebdc934bc40b0c4593d4074ee04dfe14f8c29b5d91c799f76f0e7a39b4d7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3933.0.0-darwin-arm64.tar.gz"
      sha256 "319fab5af327ae9274ea1629479f0a7f5a85eec2d74d36b6137401d3fa0b71c7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3933.0.0-linux-x64.tar.gz"
    sha256 "6b5ae8285142e761a057239032c7cebc9c3c32ec9ea3aba22f39ba57c5fb3584"
  end
  version "3933.0.0"
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
