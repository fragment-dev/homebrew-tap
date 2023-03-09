require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.8-1-darwin-x64.tar.gz"
    sha256 "cff0d3ba4c1df0058f11f861401c079f35791edeea6842f847c6ccb1753205a5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.8-1-darwin-arm64.tar.gz"
      sha256 "f1826b341b435b3bc4ad04d868df8c75dc14ae759338a937163833de3d1375a7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.8-1-linux-x64.tar.gz"
    sha256 "32be1f4e4ab785804346626afd28a5699b701f6dc2287703233230c16575e93f"
  end
  version "2023.3.8-1"
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
