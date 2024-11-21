require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5817.0.0-darwin-x64.tar.gz"
    sha256 "7f9df1f1f002fb4056ef4d3e96ec39dc3611f9aa57421f45fd84b65a6e1ad7b8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5817.0.0-darwin-arm64.tar.gz"
      sha256 "46906e1dc97abd48a5854d786aeb3b658e5b4860112a3c7b46378f60a25e9666"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5817.0.0-linux-x64.tar.gz"
    sha256 "cdca0762b578b57ecd3d66968fb5d33ccc6249acba50c85d03067ba334ac6d38"
  end
  version "5817.0.0"
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
