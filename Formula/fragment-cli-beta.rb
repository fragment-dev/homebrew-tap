require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4653.0.0-darwin-x64.tar.gz"
    sha256 "d121d5a710912d4ae82e8f8ddd24d532040e3dd3c053f4ce8d99763ce36110b4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4653.0.0-darwin-arm64.tar.gz"
      sha256 "66cb42987ebf2d679a834a2be574c7b34909df48e7b8cf999f67537ea276b3c1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4653.0.0-linux-x64.tar.gz"
    sha256 "a92b716121a78c704ab9a0567dd4fdde07fc24c8d012c7c131177e18c5e69e44"
  end
  version "4653.0.0"
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
