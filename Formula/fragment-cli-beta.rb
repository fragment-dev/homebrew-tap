require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3280.0.0-darwin-x64.tar.gz"
    sha256 "99f2c0aea1936490209e1e38173510abe351cbf7a2193bd908d8f73020fdc9d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3280.0.0-darwin-arm64.tar.gz"
      sha256 "3fed26c367f7464bccc2d870216acffcad962834e56f0bfcace2649d7713b0e4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3280.0.0-linux-x64.tar.gz"
    sha256 "397c439d230ca8ce9d9cfa05f2c4514684393774e328070f282354c408805c07"
  end
  version "3280.0.0"
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
