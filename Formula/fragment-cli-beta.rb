require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3368.0.0-darwin-x64.tar.gz"
    sha256 "18c6c56c767eef1d908c972d290aaa77e678b59fbc7cd30bb9134a2b18343c1b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3368.0.0-darwin-arm64.tar.gz"
      sha256 "163c57641ff1175b4ef794772be0d9a3ed17428510f1445690333509973abd99"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3368.0.0-linux-x64.tar.gz"
    sha256 "a9799fb296b2f0dcb8389784cda2f5ce06dec4d46e90dd80557e0910f74b02f9"
  end
  version "3368.0.0"
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
