require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2668.0.0-darwin-x64.tar.gz"
    sha256 "b5201556ac9ebe8700de9a104338450296a6dfd55f74f0a063f4283601ba16ef"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2668.0.0-darwin-arm64.tar.gz"
      sha256 "5d4d27d4129ce053697e05124ba08613296305ad8be73c5cb8e57c88bbb5c373"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2668.0.0-linux-x64.tar.gz"
    sha256 "e4a07aef422af011da85821516c63865632a2d7e55818f66677dc05f19a0edd1"
  end
  version "2668.0.0"
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
