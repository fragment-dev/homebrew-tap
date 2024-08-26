require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5536.0.0-darwin-x64.tar.gz"
    sha256 "45034c68a9c25049ff7089ef403d22efc170a97f3a7156149aaef62ab7aa10a2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5536.0.0-darwin-arm64.tar.gz"
      sha256 "4b196d2c404558535791cb4dd490d86df9524fac7935ef39769fb7ba12e4d2c5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5536.0.0-linux-x64.tar.gz"
    sha256 "b6dbcb02e3915601fcb55cdf9bffdfaa888de765382e160b1e48da15dc68d8e5"
  end
  version "5536.0.0"
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
