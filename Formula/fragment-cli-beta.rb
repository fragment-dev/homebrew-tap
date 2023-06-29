require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2983.0.0-darwin-x64.tar.gz"
    sha256 "9c1606e974dc82d0809bef99c6a572a1388f7c680d348ff54c54be05b53604c5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2983.0.0-darwin-arm64.tar.gz"
      sha256 "08b0d50372149e419d408a3ba593e6cd445920b2a4080a263b106af235c19ffc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2983.0.0-linux-x64.tar.gz"
    sha256 "aa79b5d9ec6a2dbb111da4b615cae123cdd2895e7109b940df1bbfa72b875cac"
  end
  version "2983.0.0"
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
