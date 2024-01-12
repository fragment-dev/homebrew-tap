require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4330.0.0-darwin-x64.tar.gz"
    sha256 "e71c180cacd8b565820c8797b6093626d661830b44cf9368e4c50b55466a14c1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4330.0.0-darwin-arm64.tar.gz"
      sha256 "2ed48e91b36d05d07c3712bd421198dd1622d812b2d4c6b83790a904a27ace3c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4330.0.0-linux-x64.tar.gz"
    sha256 "691b1db282e7ebac8cfb8d52137cfae5d1c97bd1a2f2514704626569d48b0b17"
  end
  version "4330.0.0"
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
