require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4191.0.0-darwin-x64.tar.gz"
    sha256 "13e65d0d72d4874f9af82ff0a101467b932391fb3b7971aecff9f9d34c8ae7fe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4191.0.0-darwin-arm64.tar.gz"
      sha256 "4ab860ea4ca9c9e9e12edce2f34facf3711e71963721d29adc12e5664e6dc13c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4191.0.0-linux-x64.tar.gz"
    sha256 "4e18533f92ab8bde3b6b2a4a63a939fc1878bb68a02a04dcbf117285a634e802"
  end
  version "4191.0.0"
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
