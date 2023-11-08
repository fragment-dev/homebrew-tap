require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.8-darwin-x64.tar.gz"
    sha256 "72a4e16ad5fd45b7d5c9e177270a88e552eb6fbce2bd0db9bc3e6ae173961333"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.8-darwin-arm64.tar.gz"
      sha256 "07539f3a327262c60b2367ece08e7e66e41984d9f14dbf86126ffb45abae89e8"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.8-linux-x64.tar.gz"
    sha256 "51d10404335b721047b351342f269cea36b182b13634e55ab30929e99b51d326"
  end
  version "2023.11.8"
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
