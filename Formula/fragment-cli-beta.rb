require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4215.0.0-darwin-x64.tar.gz"
    sha256 "4d05ca1f8aad81c6036efdaaf3ba2f53c26a81908c6732c13fc14b23c0915dfd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4215.0.0-darwin-arm64.tar.gz"
      sha256 "c07f230504c0849535ee0211cfa5b6d6f44724eb02356d1ca4dc4d1911803f4f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4215.0.0-linux-x64.tar.gz"
    sha256 "7b0c6a1ae4666c89fdf835c97506ee812c7664241a94da944d92bde76519bada"
  end
  version "4215.0.0"
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
