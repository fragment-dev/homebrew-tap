require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3020.0.0-darwin-x64.tar.gz"
    sha256 "4181ff6a184d55acb63147b7e67005ae710dde1a3dcc019c1e4dd53c7677bb29"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3020.0.0-darwin-arm64.tar.gz"
      sha256 "417ba6df59f7efd1cbde3b01594950997022162957bd4909a5b9803de3e55fd8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3020.0.0-linux-x64.tar.gz"
    sha256 "9c0e0d0d493a8a02eb583e0bb40028552002c28a524f6ece8458c8ab8398e0eb"
  end
  version "3020.0.0"
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
