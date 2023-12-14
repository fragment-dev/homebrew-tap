require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4157.0.0-darwin-x64.tar.gz"
    sha256 "7db92fb9244fb4a2615c03b3aa364e589772a0afe4375010d0f2a7265d899e2f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4157.0.0-darwin-arm64.tar.gz"
      sha256 "4e8cc45e183f3dbf5f6bded2e3f7fc477a2b4dcf4ecc7519094dbd7ebbcf8012"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4157.0.0-linux-x64.tar.gz"
    sha256 "314e9df3a3238b85016368a1295c7ae0dfbb4c3463d8d0835c31cf4a05d44557"
  end
  version "4157.0.0"
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
