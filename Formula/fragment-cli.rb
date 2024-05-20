require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.20-darwin-x64.tar.gz"
    sha256 "dc66e1c4796da4d7e769d10beb23d84c45f420d2622a4b8668e63d23a9ee4d39"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.20-darwin-arm64.tar.gz"
      sha256 "7a0cd750c9475ee1da0eac874b8df4a703e5500ed48a2451810ba4cb6312c6eb"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.20-linux-x64.tar.gz"
    sha256 "2e5abc0ebe5cce148b4d5dda602beb71c8d473a4d0cb22badbcb9ad363f82367"
  end
  version "2024.5.20"
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
