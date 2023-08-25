require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3390.0.0-darwin-x64.tar.gz"
    sha256 "5ff2e90519e0a928657e497f52b11b9e16dc237682c6427fbc8f9bb37e88e6fb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3390.0.0-darwin-arm64.tar.gz"
      sha256 "fd3d6c90eb982b952544661196a2b669feceb87b8c3a816842822d3578eb1014"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3390.0.0-linux-x64.tar.gz"
    sha256 "d3bcf2a3ccc0384c92e63388cf99bfb7a43e7ef4c6f86fa764474db8278e126c"
  end
  version "3390.0.0"
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
