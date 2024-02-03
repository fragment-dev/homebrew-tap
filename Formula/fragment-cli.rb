require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.2-2-darwin-x64.tar.gz"
    sha256 "b1c376bb9c402cfa32cfd1edcb1d8bfd5e664a81332082b0fb3772a188739af0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.2-2-darwin-arm64.tar.gz"
      sha256 "9bdc9b359598d7fd53392f9cc8d467f28a2997a4f3643a7d2dbc4768e9af4348"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.2-2-linux-x64.tar.gz"
    sha256 "aa4e5a12f381cf54a911eea833aa894e616878734c6b95ffd87c7b53c836b229"
  end
  version "2024.2.2-2"
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
