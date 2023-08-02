require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3216.0.0-darwin-x64.tar.gz"
    sha256 "90ec14a1211d3bb4229d06c433991292e591db42b939591a3d36a0a1373bcb85"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3216.0.0-darwin-arm64.tar.gz"
      sha256 "4c5fcaa07f3b2e6b6a92c556ce08649f106feb71478873bb340349d44ca2c5bf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3216.0.0-linux-x64.tar.gz"
    sha256 "7a447d4dd826e24e386caa990872a2d395ec3bb90b3726eb3a879b68804a8895"
  end
  version "3216.0.0"
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
