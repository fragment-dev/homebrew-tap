require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2228.0.0-darwin-x64.tar.gz"
    sha256 "8c61afa6abb45621ada0792ce622634b646dede54d9e0c296644a0a68c00df9c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2228.0.0-darwin-arm64.tar.gz"
      sha256 "7b38ca37c8c703b7d358f9122f82ddfe3bedd587a18953e3dbe987ad8def3cef"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2228.0.0-linux-x64.tar.gz"
    sha256 "eaa5d581e7cb005d817ae1e51ee2dd27bef06e3b020740fd3a2aae3c32209f96"
  end
  version "2228.0.0"
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
