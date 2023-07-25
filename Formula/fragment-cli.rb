require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.25-darwin-x64.tar.gz"
    sha256 "37a8dba94440e26558765afabfc9b691a4e0c59960b54dd7af70a06dd3c92693"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.25-darwin-arm64.tar.gz"
      sha256 "f7780d04cf4d4e4c1e55f082e4e114411d369a8eacd7dc28ab58a46608b2f365"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.25-linux-x64.tar.gz"
    sha256 "015d45e63bd4886c17fdb94cf8d67cd3edeeb79a400cb834a34e5bffe9130e00"
  end
  version "2023.7.25"
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
