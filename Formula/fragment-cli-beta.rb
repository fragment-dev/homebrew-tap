require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3975.0.0-darwin-x64.tar.gz"
    sha256 "ae2c465b7a79e17aec4a9cdb9cc32851c271a0509518e109626b91006cb157e9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3975.0.0-darwin-arm64.tar.gz"
      sha256 "551d4ca8005e8049101edc6abdd3b1eebad89ae82d711948532ac978cfc96dcc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3975.0.0-linux-x64.tar.gz"
    sha256 "b737340671d1e38c78bcc1c84a3e1d6a08a30eeed667464add1785353082cf3a"
  end
  version "3975.0.0"
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
