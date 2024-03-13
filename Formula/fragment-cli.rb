require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.13-darwin-x64.tar.gz"
    sha256 "b14099f514b84ecbfbaaeebe1c3e5faa853b1ed147f350f98aab661bce2d4517"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.13-darwin-arm64.tar.gz"
      sha256 "af0ee861d47dd05a99da714465c23397e529304b2ef9f24b12f1fb647a425f80"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.13-linux-x64.tar.gz"
    sha256 "aea43a1551c256ed9e151153642d10b575879712c200b665d4c7a7d4f9525c27"
  end
  version "2024.3.13"
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
