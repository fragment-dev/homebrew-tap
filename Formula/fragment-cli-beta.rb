require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3651.0.0-darwin-x64.tar.gz"
    sha256 "3bd200f652e0e65e9c2b8e348989456afce399565c8beac15967d88086753d63"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3651.0.0-darwin-arm64.tar.gz"
      sha256 "061932d29d17aba5e271b441c99a2c0391856ac1820c02238fd78ce6a87f794a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3651.0.0-linux-x64.tar.gz"
    sha256 "cac64dc6935e45a8eb8c5c568e597243207f64f9a5c3bf6107a549634108bb45"
  end
  version "3651.0.0"
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
