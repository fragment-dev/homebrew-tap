require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5138.0.0-darwin-x64.tar.gz"
    sha256 "11e9a99e32ff92cc395f31a49ed543efcb732beabc8038f7550d088bff355949"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5138.0.0-darwin-arm64.tar.gz"
      sha256 "4bd5b9623b8d4d97ab00aec1644ccad4eb40a1974f49f8737e64f4a7ae48f3e2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5138.0.0-linux-x64.tar.gz"
    sha256 "ca3680d914915f073f00e5ca7aaea71edc28b19b8f003d1ff304add00975bca2"
  end
  version "5138.0.0"
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
