require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4045.0.0-darwin-x64.tar.gz"
    sha256 "5af69fe3cac2471dac5a5d3d90e481ed7046be8c405fd25c2afaa67aa5e935ff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4045.0.0-darwin-arm64.tar.gz"
      sha256 "9e45362d16ecc1d1bf7c6fd4645ef9546c0c33372ba6425d7984b57e4ddf2807"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4045.0.0-linux-x64.tar.gz"
    sha256 "263ba14aa376800244228eb39b367beaf19b8e37692d3e2ecce32a638e9ffe82"
  end
  version "4045.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
