require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.30-darwin-x64.tar.gz"
    sha256 "3dd136b94112025a6d2a5d17aedf3262885d29857e015aade5111f08fadec0a1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.30-darwin-arm64.tar.gz"
      sha256 "052d153bf9b07f40a9f683055d73884942bd80ded39869fa69d49c3715b97a67"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.30-linux-x64.tar.gz"
    sha256 "2ad7ea1d35a8062beb54bfcfefb48568b8e72bb7871cbe9724bdd546504db63e"
  end
  version "2024.7.30"
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
