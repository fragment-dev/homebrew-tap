require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5395.0.0-darwin-x64.tar.gz"
    sha256 "ec065ac413b3608aea5812744f0401bfffcaa8a408ed2aa16bea7641f1b3c313"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5395.0.0-darwin-arm64.tar.gz"
      sha256 "d27251935e4f6fdff3c1f12b2b4b9f6c1fa999b682568470f893cad39bf4e6a8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5395.0.0-linux-x64.tar.gz"
    sha256 "f5be1c26d8e48b40a85843086b254c40d60a15a2d9fbd22d6900069b6e73691d"
  end
  version "5395.0.0"
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
