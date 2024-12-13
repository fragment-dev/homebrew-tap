require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.13-darwin-x64.tar.gz"
    sha256 "16d56ab3de70292bd387b4a11286f04cf5f689a806222c15c1ba7ffeef861de2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.13-darwin-arm64.tar.gz"
      sha256 "ee5c633fc2a73bd9a422735fbd13fc3502a9f4e0b91674c1afb138a4f3df40fd"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.13-linux-x64.tar.gz"
    sha256 "6f9f458ea56cda7e439f224efdc41d1b5782feb1fda08be63837e681f8e43411"
  end
  version "2024.12.13"
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
