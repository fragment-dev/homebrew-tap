require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5342.0.0-darwin-x64.tar.gz"
    sha256 "d0fcc947beb810ff40c402c076c3b53cbc2a991379f45b42b1ed700fa497218e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5342.0.0-darwin-arm64.tar.gz"
      sha256 "debb3e9b56c871bea3ef9243ebbb33107a598bd590f13739288e623984fa6c3e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5342.0.0-linux-x64.tar.gz"
    sha256 "7c6feeb6c1ac85423dc1f07ea750553f43600e3badba998265ac01c9931693e4"
  end
  version "5342.0.0"
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
