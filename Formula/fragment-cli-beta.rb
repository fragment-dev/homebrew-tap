require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4103.0.0-darwin-x64.tar.gz"
    sha256 "ebddb29afd92dfe2c177de4fceae55a0bfadeb6bff04f8a31aa5788091789723"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4103.0.0-darwin-arm64.tar.gz"
      sha256 "af1f342ddbd15900a823649e10aa3fc1d2c909cb5006c6cee8b826e7478b2c84"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4103.0.0-linux-x64.tar.gz"
    sha256 "09c589d49d3ddfe02b20ab806111d4d5df578d9091a55dcfecb4de4728c41d49"
  end
  version "4103.0.0"
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
