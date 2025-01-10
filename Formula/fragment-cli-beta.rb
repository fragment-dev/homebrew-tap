require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6070.0.0-darwin-x64.tar.gz"
    sha256 "c7d6f623af667449413bc76919ed7f11be8376fa16f62bc0718f662571673c71"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6070.0.0-darwin-arm64.tar.gz"
      sha256 "d5b74ffc93bd8a58ab84f5f19710621756c02c59665dacb0de8fbb098ae43ee4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6070.0.0-linux-x64.tar.gz"
    sha256 "9541eb5bbbacec345a83d4d3dfae0eb867a40dbddb47aa8945c6abe198f8d3f0"
  end
  version "6070.0.0"
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
