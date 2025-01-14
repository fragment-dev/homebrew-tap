require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.13-darwin-x64.tar.gz"
    sha256 "1c5fd84c5ebfe797b0629ba003f98abda741858f66367ecb0d5722f64ea17d68"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.13-darwin-arm64.tar.gz"
      sha256 "09a41c3e6818639306991915d73504ebdc2bbf9b3920914bc31b66556f29df36"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.13-linux-x64.tar.gz"
    sha256 "ef3ba033a223578eb1f1c5935b4066317622fbbc3bee6b40e0b17228ebeacf30"
  end
  version "2025.1.13"
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
