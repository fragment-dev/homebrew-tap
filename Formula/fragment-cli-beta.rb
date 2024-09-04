require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5562.0.0-darwin-x64.tar.gz"
    sha256 "0d9a5ae9ecb74370aa94bc32c2d94277d81e453c6d5126357785a600937b2107"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5562.0.0-darwin-arm64.tar.gz"
      sha256 "8d7141dcae98cfe25c236c6f4175806c61b93638910ef037afc0065f7e3423d5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5562.0.0-linux-x64.tar.gz"
    sha256 "5746c5dbcb3526946b92c9bf793b774421bc3c610a2556fa483d06712915fc24"
  end
  version "5562.0.0"
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
