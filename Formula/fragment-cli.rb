require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.13-1-darwin-x64.tar.gz"
    sha256 "b2dc0c00b38530b5220fecfe2c8e6944d0baeaae6b625379458775279d890766"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.13-1-darwin-arm64.tar.gz"
      sha256 "c746b80e342102b16e2135f942d01d57bc81849fced1f440910c74ba7434468a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.13-1-linux-x64.tar.gz"
    sha256 "aab4e62cc4b9a8cd5e5965f1cd63165e6571dc7dcb66785ebb6158e17912fd7a"
  end
  version "2023.10.13-1"
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
