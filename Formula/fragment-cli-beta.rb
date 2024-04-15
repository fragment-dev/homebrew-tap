require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4900.0.0-darwin-x64.tar.gz"
    sha256 "176eb36ba0a22bac6d51d01d4ad7895cf3033a0d9cf151a1fa58c938330c7dbb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4900.0.0-darwin-arm64.tar.gz"
      sha256 "a7f12cf5f211a79acd90399f4f3898c2c6caff429949d08b36cae884ed83fb3c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4900.0.0-linux-x64.tar.gz"
    sha256 "07fe66c56b5051e0ddabc76d880e0441797bc2f70c0899e00b00e6e4444a4b9c"
  end
  version "4900.0.0"
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
