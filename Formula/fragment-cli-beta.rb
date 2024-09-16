require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5592.0.0-darwin-x64.tar.gz"
    sha256 "fe7b4217cc72f0688d7397c1f9e8e7edc41be696f825c2b263c177d979d0cccd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5592.0.0-darwin-arm64.tar.gz"
      sha256 "476992b8704897c44956af8e33999a652a0dca3159d1f3b19969d334b47859dd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5592.0.0-linux-x64.tar.gz"
    sha256 "5a5f5e151b90631c33d60d8d49614d9792803db9f274b9a2f5529a11a2deeadd"
  end
  version "5592.0.0"
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
