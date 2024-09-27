require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5628.0.0-darwin-x64.tar.gz"
    sha256 "52a72adcdb4ac776923967bf126d3d7876d577219d2be30958f48cf63178231a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5628.0.0-darwin-arm64.tar.gz"
      sha256 "4b45a5ef96128c524e6bb8264c11d77007d713a0672467f164a348afcd5028d1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5628.0.0-linux-x64.tar.gz"
    sha256 "976814b3c38178c786c9c851370d8326ff6588a6e46bec6e7a8f249dca3dd556"
  end
  version "5628.0.0"
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
