require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3599.0.0-darwin-x64.tar.gz"
    sha256 "b25af5c980a7450450cdcf4957c92d9d1b1b7995ad0cc7f01a375405d9bc22c2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3599.0.0-darwin-arm64.tar.gz"
      sha256 "7fec58e13ac198e04647f78fe750eef0569c9cfa95939cd314dba4d4b70d1fcd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3599.0.0-linux-x64.tar.gz"
    sha256 "c1787fee6aa5de1e469dc0b8e13d67b75c21109e16a432f29c407d8915646e4a"
  end
  version "3599.0.0"
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
