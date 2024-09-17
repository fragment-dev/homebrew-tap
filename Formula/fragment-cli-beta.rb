require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5603.0.0-darwin-x64.tar.gz"
    sha256 "4646d0d4362cdb0f72ff71e14fb0193e90543f5027f9be03f239c2320f67e92b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5603.0.0-darwin-arm64.tar.gz"
      sha256 "b3a04efc91a235c919676b20a857ce85b193d6e1b0dec7d89a60830b1514126a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5603.0.0-linux-x64.tar.gz"
    sha256 "730decbb5a54f975bed0f6eb8576dd78fd57cb57906c6c8a50357ae253f5a972"
  end
  version "5603.0.0"
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
