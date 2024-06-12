require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.12-darwin-x64.tar.gz"
    sha256 "626082a20c18dd123387e32a4d4a82d6c07bf065573d0bc85ef73964526d0ef5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.12-darwin-arm64.tar.gz"
      sha256 "ae0b6c951d7b9f9a4ac52a7c806a0340ec9d0486f7722f80b7ae6d08b27740cc"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.12-linux-x64.tar.gz"
    sha256 "e5e660243b75afb6a7c5a3afe36a18b7aee02412ebb3ae12702493564e63fd3d"
  end
  version "2024.6.12"
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
