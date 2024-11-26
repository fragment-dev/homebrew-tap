require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5833.0.0-darwin-x64.tar.gz"
    sha256 "84a9ac0335018631c596f5e664ac96936882b863460da3bc7b9e4a22840afe5f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5833.0.0-darwin-arm64.tar.gz"
      sha256 "ecef267ae6e64fb1c3e214241df0955b8ad4a11f3f87817f0b739fb79782c30f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5833.0.0-linux-x64.tar.gz"
    sha256 "dee2d7cfa15b07c9554f01d0e98617f4923e343d1aa38677b63697322709e987"
  end
  version "5833.0.0"
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
