require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5654.0.0-darwin-x64.tar.gz"
    sha256 "c463ab5554c3680260f045f01b07184d77e970448c3e5b5b77ea55d568be4176"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5654.0.0-darwin-arm64.tar.gz"
      sha256 "470421bba5fdb7cb7a5f071a6e8e8b7175079bdd79582c622f97bbb55a5e7b11"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5654.0.0-linux-x64.tar.gz"
    sha256 "93ce9c12cd983db09a5075e4567c89f4f94e796e64747c6593a89fc227df0571"
  end
  version "5654.0.0"
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
