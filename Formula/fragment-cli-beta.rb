require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5940.0.0-darwin-x64.tar.gz"
    sha256 "477b080a9d30cb13a3069b62015db2515a97875d22a9acdf1824b5632b289581"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5940.0.0-darwin-arm64.tar.gz"
      sha256 "a392b51dc9357b0562a9d69ecf878403f25292fa08382157d0740eb2cac8cf14"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5940.0.0-linux-x64.tar.gz"
    sha256 "7f44ef33548a9708490ba25f17efbca4330eb88f9354cf245f48b3bcb173804c"
  end
  version "5940.0.0"
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
