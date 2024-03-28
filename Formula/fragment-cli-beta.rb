require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4816.0.0-darwin-x64.tar.gz"
    sha256 "297af252a977edb368cd42fd19e026135b007fffd4e504b044f2fa3712020006"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4816.0.0-darwin-arm64.tar.gz"
      sha256 "3995cc9bcb3294bc41859e39f0b013c7e11081ede3aac1ec1b10665c1b254bab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4816.0.0-linux-x64.tar.gz"
    sha256 "9f15192eda236a4c1ffd4cecb430837d5cd2be7978192c5944339e417ee8923d"
  end
  version "4816.0.0"
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
