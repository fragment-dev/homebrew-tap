require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2554.0.0-darwin-x64.tar.gz"
    sha256 "10652fee9b01deb32c01e92bed4b6b514264dd1cdfeb49e482a523f7ea0365fe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2554.0.0-darwin-arm64.tar.gz"
      sha256 "f9746c36d8276303a1d16ed007dc442f32da3fa0bf64e19ac940a6daea6d41a1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2554.0.0-linux-x64.tar.gz"
    sha256 "5300ac2735b5b2286a1a866ff5001240ea8f11eaa0d00f69c6998418860fff8b"
  end
  version "2554.0.0"
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
