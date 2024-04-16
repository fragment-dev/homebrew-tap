require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4906.0.0-darwin-x64.tar.gz"
    sha256 "89bfd698742ad257ac94f2a652b30ffcaabc7ac4eab8bc78d0c6fcad546f5004"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4906.0.0-darwin-arm64.tar.gz"
      sha256 "2b40358c4ae1bbf3f0dad2965680faa58b628fd145d294d37a33fffdf01cb89c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4906.0.0-linux-x64.tar.gz"
    sha256 "690f87508a6268da3e17c1938bc7452eaef3c2be449e034bfc9a9edebe013f87"
  end
  version "4906.0.0"
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
