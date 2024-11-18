require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5789.0.0-darwin-x64.tar.gz"
    sha256 "aa7ae9b67bcd9f687ca47b17462672e66819fb3f2c3813853b312645a3eadaaa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5789.0.0-darwin-arm64.tar.gz"
      sha256 "70ca4fef40d12d28928f28fc7aee86113fa9bbdf71eef76564c8093fb4334dba"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5789.0.0-linux-x64.tar.gz"
    sha256 "15bca32e9a7bfacb61b762777b6413cb8532525f063d219769135acd0ea615c7"
  end
  version "5789.0.0"
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
