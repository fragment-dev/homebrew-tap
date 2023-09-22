require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3653.0.0-darwin-x64.tar.gz"
    sha256 "36f40898438e5f5468e34f12f7bcdd1594e6d1457f42c12ee8929c15406efd87"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3653.0.0-darwin-arm64.tar.gz"
      sha256 "8a15d15c4365c56b513958be73db2b2ca32c35b3b4d03120060ec28c2d4a05f0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3653.0.0-linux-x64.tar.gz"
    sha256 "41898910a620837023fcc5a66eece99296d53fb47fea69648dc26cf68db4fa71"
  end
  version "3653.0.0"
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
