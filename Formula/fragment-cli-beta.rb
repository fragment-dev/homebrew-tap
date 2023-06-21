require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2889.0.0-darwin-x64.tar.gz"
    sha256 "1f0c7a0b912b20d8c87f805a9d004ec3971167e8ead1c85bf83687085e655316"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2889.0.0-darwin-arm64.tar.gz"
      sha256 "234586fad73ecaab8529726abe26838410436e8ae47cfd3e8ddfdf2827bff77e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2889.0.0-linux-x64.tar.gz"
    sha256 "7746d56b89e4b61e509903ae13979551ef70502603bf6d43f3c1084ef5387334"
  end
  version "2889.0.0"
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
