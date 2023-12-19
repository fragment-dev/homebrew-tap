require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4171.0.0-darwin-x64.tar.gz"
    sha256 "c53276659df3f4d492474711af96ef3c23593ff1cf0d5ebe31b677c5d6a10dba"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4171.0.0-darwin-arm64.tar.gz"
      sha256 "fa5dae3597f9f941d47855d7cb31b7bf4d47cc481a66003d295e870c27231594"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4171.0.0-linux-x64.tar.gz"
    sha256 "279de4cd2744edffc788b0ef8d3e5c054fedb51f832702aeb7d2ca11ac6a5ac7"
  end
  version "4171.0.0"
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
