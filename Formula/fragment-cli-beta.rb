require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6122.0.0-darwin-x64.tar.gz"
    sha256 "344b57103ea436e6b43c8135249f212d01629425b597c9d34290db46e77308c7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6122.0.0-darwin-arm64.tar.gz"
      sha256 "62e5b4b3a0e6c910e1129be4d8fd14967ec1543512902e459f3ce5ca3972de97"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6122.0.0-linux-x64.tar.gz"
    sha256 "ca70b3d2bdb32ab1d7a26914dd63034a983fb9e00a5ca47ba2ce3e1675b2f137"
  end
  version "6122.0.0"
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
