require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5625.0.0-darwin-x64.tar.gz"
    sha256 "958c24199c5a5c88d3d953a00c2321f4a77b121197ce63ce5cd8531278024d7b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5625.0.0-darwin-arm64.tar.gz"
      sha256 "3b650b1362312c5e9993acc3bd74a3c5c6b0d64c3a689d86a7896d057b42fe10"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5625.0.0-linux-x64.tar.gz"
    sha256 "646cf572bdbfb562dbc60e75a825d8ab7140a527379e86bd1b764560377fb0c0"
  end
  version "5625.0.0"
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
