require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3168.0.0-darwin-x64.tar.gz"
    sha256 "e418e5ce092297a8e36f3141114a2f853f167df45a2cc92d8bde0938c35f9209"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3168.0.0-darwin-arm64.tar.gz"
      sha256 "ad5ad55b54359dcb99f0be21ff1370387de6b7f442fb2b9530ba326630dda584"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3168.0.0-linux-x64.tar.gz"
    sha256 "3d1c46cdfbda634f369e24180254c6276602378a44b7e7c65a021e13dbf951ea"
  end
  version "3168.0.0"
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
