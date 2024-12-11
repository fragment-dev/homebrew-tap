require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5875.0.0-darwin-x64.tar.gz"
    sha256 "21aea14e3d378f2b763019a0db87a4868fdf47f0b140d7fe8a95086024fa3309"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5875.0.0-darwin-arm64.tar.gz"
      sha256 "f67db1c6e7e71af8d2675dfafbbd43a14cfe9ee587581b1763396a6a68f61b11"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5875.0.0-linux-x64.tar.gz"
    sha256 "b212ed19cfbaa3fa4df2bfe461ba1a40ee4db11fb9a5a665a94215dd39b50760"
  end
  version "5875.0.0"
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
