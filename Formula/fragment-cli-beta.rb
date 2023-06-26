require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2924.0.0-darwin-x64.tar.gz"
    sha256 "616b391d2e27fff9e433fa56143c3fb9a9746d9bbc3a87bae11e0df94075949b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2924.0.0-darwin-arm64.tar.gz"
      sha256 "951beb01e642713bf92810ab4fab758f7efcedee951ca802c31d4606fa400832"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2924.0.0-linux-x64.tar.gz"
    sha256 "77cb9bd0b0b4ed2caa1c7e2c336b49ab285fa8318a961d717c0ee18d9c8eb4ea"
  end
  version "2924.0.0"
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
