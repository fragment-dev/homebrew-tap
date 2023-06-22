require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2894.0.0-darwin-x64.tar.gz"
    sha256 "f5d162b8c8fd70bde046ce63c2df342f44264ff7cc43f65c0d83b46396587b0b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2894.0.0-darwin-arm64.tar.gz"
      sha256 "c4b03d1d62be144d1389e43242d4d5cb64785833bac4e9e02d88106232885189"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2894.0.0-linux-x64.tar.gz"
    sha256 "b06d253f5fe9eb37c19a210186cb5a6db11a92bcfcdfe2914be5fef96aed98fc"
  end
  version "2894.0.0"
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
