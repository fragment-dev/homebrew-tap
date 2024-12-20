require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5944.0.0-darwin-x64.tar.gz"
    sha256 "3b015ace3429258a20af72312e6cddb9dd1ae506a800e57247ed2d996ea2c611"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5944.0.0-darwin-arm64.tar.gz"
      sha256 "63194198bc039c3acaefe2e4c5e04f99280e9aaea887cf994ab27eeaf23a4f21"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5944.0.0-linux-x64.tar.gz"
    sha256 "fb362edec013ce1b17c7a3a17f9f54055409183ca3835cf9b2d770d921f99acc"
  end
  version "5944.0.0"
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
