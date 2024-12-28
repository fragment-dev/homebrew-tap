require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5998.0.0-darwin-x64.tar.gz"
    sha256 "10ee09407bd269beb90ad8ff1ae08df56757c9e3423ae792829dc712200d1971"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5998.0.0-darwin-arm64.tar.gz"
      sha256 "13144144dae6aee398cb6090091cf6d42d229b1af2469408bd46e1b97ce9d69d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5998.0.0-linux-x64.tar.gz"
    sha256 "463aa40368b6375397ba5effaa9a1472945cb5670db7f104f129b716b9360fc8"
  end
  version "5998.0.0"
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
