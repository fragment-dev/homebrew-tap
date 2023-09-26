require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3668.0.0-darwin-x64.tar.gz"
    sha256 "45c935cd72ace6cfa976b1940f62dd8d3f0a8174cd05b4dad212066bc56152d5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3668.0.0-darwin-arm64.tar.gz"
      sha256 "c7f6145c5cbd2cdb4eabe82136825590bf3b18b72ed018e62bc51e97d6000c9e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3668.0.0-linux-x64.tar.gz"
    sha256 "9b217e4709946f7b512cee6b06c738d5737a4339a48965051f3e4928bdf90b24"
  end
  version "3668.0.0"
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
