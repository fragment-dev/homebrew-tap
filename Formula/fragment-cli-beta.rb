require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4617.0.0-darwin-x64.tar.gz"
    sha256 "4c43169f204014acba8851119c4040e34f58da142373da602c26c0c7ad15bb7c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4617.0.0-darwin-arm64.tar.gz"
      sha256 "275adc1ed4573dc1125a010749c085346134d000648944b740312aa9d89a19cf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4617.0.0-linux-x64.tar.gz"
    sha256 "73e7a8bf22d2e53e84f43664f1c58a23e217f167d69a70f1e7bdca6a35af1d96"
  end
  version "4617.0.0"
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
