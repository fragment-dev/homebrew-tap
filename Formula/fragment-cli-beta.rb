require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5488.0.0-darwin-x64.tar.gz"
    sha256 "22cf6ae3dace9f6ed61dc891327db5f7f1830efb722602899f3811d0a225af09"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5488.0.0-darwin-arm64.tar.gz"
      sha256 "d3048f938bd614ddf93d661ddafd7ec066b2ca4f38f7af63927e0edcf93de7bd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5488.0.0-linux-x64.tar.gz"
    sha256 "4e1d41687cff65a4accd9d4d994390de86c0cc2c6f9998b495e5b52d895111f1"
  end
  version "5488.0.0"
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
