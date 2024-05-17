require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5080.0.0-darwin-x64.tar.gz"
    sha256 "9ab5e8dfd347767de3b53d3896b9aa2d93f3faa7a0384714aa798779f6086163"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5080.0.0-darwin-arm64.tar.gz"
      sha256 "2cb6348ce43450e7606e3be4f2221ff8022c92a017c7c23d76c680cc68456c0e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5080.0.0-linux-x64.tar.gz"
    sha256 "f5ea6d5911d412d91082cd7e16bcb292da64e930cc0873ca23d3f442529dc7f5"
  end
  version "5080.0.0"
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
