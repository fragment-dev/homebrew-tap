require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4684.0.0-darwin-x64.tar.gz"
    sha256 "9935d0b98da2d27261da5a008c5e1c1e115b815a733824310d32803d9e639772"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4684.0.0-darwin-arm64.tar.gz"
      sha256 "3808e779df93973b0258926b3ce37e67981a3d5e9074b1866b3417b57eb5cb5a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4684.0.0-linux-x64.tar.gz"
    sha256 "debc81d6d555979313c788446310458ed63c20c72012e050ad620d4739273971"
  end
  version "4684.0.0"
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
