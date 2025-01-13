require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6074.0.0-darwin-x64.tar.gz"
    sha256 "6ccb1d145f4ff8a3840dc7bda664453424cac0ae84ed8cfa5077584bed24cd0c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6074.0.0-darwin-arm64.tar.gz"
      sha256 "47ba3b301fc8c95cd19dfb5d4a3f874712ad797a957d495bcc7d80e1b835a76c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6074.0.0-linux-x64.tar.gz"
    sha256 "8737616240f23e5e0c981db5636d1493c9f57b530dae2268e97819a8993fe92c"
  end
  version "6074.0.0"
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
