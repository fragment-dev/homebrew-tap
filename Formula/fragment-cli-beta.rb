require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2530.0.0-darwin-x64.tar.gz"
    sha256 "5ca9a342c393edfc37c9e42319bded6e15af7b1c65fcb43ea4bd3b06ffde4055"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2530.0.0-darwin-arm64.tar.gz"
      sha256 "376376ccc169254fa9bb09a887b8249314bba14ae89e7edbee8d9560358f1453"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2530.0.0-linux-x64.tar.gz"
    sha256 "cda797c9df5815b686ccd34cd2c3b049b627a998b94b48f2fe78d1bce9f9c9b8"
  end
  version "2530.0.0"
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
