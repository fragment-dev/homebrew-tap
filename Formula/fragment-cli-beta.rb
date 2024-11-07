require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5746.0.0-darwin-x64.tar.gz"
    sha256 "339ae764af88a9471e2aa08518d837e36a62d8a09104d7a84c487f95ac0a64c3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5746.0.0-darwin-arm64.tar.gz"
      sha256 "4934c7853b69e1d50a37d04f7f6a111726c0e9f7945ec1cca4e1b2910e9ff0bd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5746.0.0-linux-x64.tar.gz"
    sha256 "25f4d093d217c310d2e40016e98b76e99e9e1e2982821ebe581eb6a7026d1581"
  end
  version "5746.0.0"
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
