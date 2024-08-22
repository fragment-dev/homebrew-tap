require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5531.0.0-darwin-x64.tar.gz"
    sha256 "d778443c9a7cbdd2d6aef5d648187097c29638041775a4c575d57fe2505d5036"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5531.0.0-darwin-arm64.tar.gz"
      sha256 "a99c51b997f34fb3245c27e4c8d1b6449571790ca8456f94eb694fc78bfea664"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5531.0.0-linux-x64.tar.gz"
    sha256 "0298309405784dca13ee12a76ae039be6bee15a84efb60fe616c03666a229e0d"
  end
  version "5531.0.0"
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
