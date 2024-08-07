require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5481.0.0-darwin-x64.tar.gz"
    sha256 "8eb7aaa7a161172cc8813cbd96ac49d93f58cea41ab79de97678386cc6ff0603"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5481.0.0-darwin-arm64.tar.gz"
      sha256 "5c8e79176d7cd099221feb584ce70ecb30f34fd84f3c2f08b79ea59c20b8af09"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5481.0.0-linux-x64.tar.gz"
    sha256 "be536ce46fff33b4ef5edd1062e657eeec347ad44d6e1cdca59656611197ae2c"
  end
  version "5481.0.0"
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
