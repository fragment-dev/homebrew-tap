require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5690.0.0-darwin-x64.tar.gz"
    sha256 "3eb91392e91aa71cb34bf4da0b04c84393fdd3f96c76c25d1ac8ca54aca15611"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5690.0.0-darwin-arm64.tar.gz"
      sha256 "81cb2a834f83de792c10355fedb2b2c76f343bebceeacc28fc2656337da98b92"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5690.0.0-linux-x64.tar.gz"
    sha256 "d143cc987f7c590d01d9d2bf8cc241c93a54aec6f35c3ff0647e0ca9e2747abc"
  end
  version "5690.0.0"
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
