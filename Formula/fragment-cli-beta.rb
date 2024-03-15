require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4773.0.0-darwin-x64.tar.gz"
    sha256 "9e92476ddee96ad5320c7e50809eb6588080a5e35d18eceb81584fe8fe0cf5dc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4773.0.0-darwin-arm64.tar.gz"
      sha256 "1526458dfe609ef21acdc0122b086f9eb44e5668609d9933bb458e3889641078"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4773.0.0-linux-x64.tar.gz"
    sha256 "6b04198acb0ab4f9a7bef5d1a7dc384c3d3236f83d5afc89b161e7cc9ce787d8"
  end
  version "4773.0.0"
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
