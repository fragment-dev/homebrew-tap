require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.21-darwin-x64.tar.gz"
    sha256 "e7f5d65d34c59613b9b48cecf516322e66232b8a3d54b9dbb0f22db820c6e25c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.21-darwin-arm64.tar.gz"
      sha256 "163ecbc9e9b3712e92b65e7ec0076d0e9cc1cc176d0d3097913c8fd81cac1657"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.21-linux-x64.tar.gz"
    sha256 "23680a9bcbbf7dc7a560ae9757e62108baebe85beb623d160c962f514065daca"
  end
  version "2024.8.21"
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
