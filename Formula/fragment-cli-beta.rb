require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2898.0.0-darwin-x64.tar.gz"
    sha256 "147370b5db1eb12e09dd62f42e724f031262d1fbcb1248fce249dd7388979afa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2898.0.0-darwin-arm64.tar.gz"
      sha256 "0a0efa905fdf7f816bd80f22d43dcfa961638dcb7e2805a22acd87c0f6d5345c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2898.0.0-linux-x64.tar.gz"
    sha256 "8cfa201e78673a01d7ab97157a0e04c19a727c1329cee5320a647f4e5b13ad5a"
  end
  version "2898.0.0"
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
