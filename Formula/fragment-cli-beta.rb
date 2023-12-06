require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4102.0.0-darwin-x64.tar.gz"
    sha256 "d9032cbbec4d15c14ead2f5427c44045b9626fd9614f7a8368aaa4db1d04cdd5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4102.0.0-darwin-arm64.tar.gz"
      sha256 "45bafd56bf7c59d3bf624c99c6d52eb5511d27a975b800e0cc8c82c96ecfd315"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4102.0.0-linux-x64.tar.gz"
    sha256 "d79bf49bbfce4853a2f79d92248f07f794f713bfd3df10e3fb14add0889ea7a1"
  end
  version "4102.0.0"
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
