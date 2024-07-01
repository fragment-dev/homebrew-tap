require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.1-darwin-x64.tar.gz"
    sha256 "f6b236a90f978f439af8a57f770b7f1362802a76a1dc2bc0a0bb5f8cf44114b1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.1-darwin-arm64.tar.gz"
      sha256 "b01297a03f0bebafc8f1972d1e9b25c04e7814eae8314e0687bfacb255d6d070"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.1-linux-x64.tar.gz"
    sha256 "72c5eed6bf65b4560077915228ef62f37bf73a402f9434fb11af0455572da067"
  end
  version "2024.7.1"
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
