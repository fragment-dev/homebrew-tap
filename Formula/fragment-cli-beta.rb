require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1863.0.0-darwin-x64.tar.gz"
    sha256 "d3be604b9fc3a27ed6b8edf06836c721b5b54eebc325777021622a0ac57e50f4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1863.0.0-darwin-arm64.tar.gz"
      sha256 "6841df2e061f861678a30c3eb6e203753305809f193f2101e064d66e0221f183"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1863.0.0-linux-x64.tar.gz"
    sha256 "7db5692f4210b903bcb4995170567c66b4445ca2f7568a3f51c2fbfeac99525c"
  end
  version "1863.0.0"
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
