require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3696.0.0-darwin-x64.tar.gz"
    sha256 "109083fce68e35a1fdee18e7a2db5f6fa4c45d26dedd93959fa1e9665ef4081f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3696.0.0-darwin-arm64.tar.gz"
      sha256 "ea2bdc0888cb22a9319f0cbe55eea903b82d52be50121705c0880cbb94e07a44"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3696.0.0-linux-x64.tar.gz"
    sha256 "5b67734d9711d87e7a808ab532ccaa4915c5a17b7325e027e7ebc329b4c8cb72"
  end
  version "3696.0.0"
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
