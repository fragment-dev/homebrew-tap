require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3521.0.0-darwin-x64.tar.gz"
    sha256 "72b9d63c5667b9e8efa9a14595092753f6f32b67e21eef08ddefc80c5ab927b4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3521.0.0-darwin-arm64.tar.gz"
      sha256 "a0f7409fd60bc1feb34e943362a8887b310fd7fe218cfe8cadc3f6e88d480cab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3521.0.0-linux-x64.tar.gz"
    sha256 "97b73833dd1d51e27e21c60bcf6344808a909fe4e6e27872339a813ba9fe0663"
  end
  version "3521.0.0"
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
