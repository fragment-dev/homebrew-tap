require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3119.0.0-darwin-x64.tar.gz"
    sha256 "a8609fc11f3d270e360efa6c811460b09532417d963c85e95b62929034eb02f9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3119.0.0-darwin-arm64.tar.gz"
      sha256 "5b7484399a160f25497d9c8b243ba399473fedd508f077f11b4502fd6fafa1bf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3119.0.0-linux-x64.tar.gz"
    sha256 "0cd00b463e08d6e9c05ab045a6b2cb2fe47272ad424f0cd5707c040f2d9584da"
  end
  version "3119.0.0"
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
