require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2475.0.0-darwin-x64.tar.gz"
    sha256 "d45e935112823873966e970a143467e18e1adfb580c1067f613b62b0996ae0c4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2475.0.0-darwin-arm64.tar.gz"
      sha256 "9bcb6cdcc8d2794fca5d9eda87ccc7595ca888fa04432e8d9a742f988434573d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2475.0.0-linux-x64.tar.gz"
    sha256 "5a5ce8f55b7b5e305567ec1b166620d2a9854cb949105dd76d6fdf255b9d88e2"
  end
  version "2475.0.0"
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
