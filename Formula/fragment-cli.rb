require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.19-darwin-x64.tar.gz"
    sha256 "ba101762c5cb05e32c2588c848bec5adc0ec5e471a3a830cc60fb440471d9ff8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.19-darwin-arm64.tar.gz"
      sha256 "d21997fa5a3446e01ebad5729379ba2136e254f85575dc0e181f76f266307dae"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.19-linux-x64.tar.gz"
    sha256 "e7b47940465e60127048e53fca040923ebc05905963d49166caa41e7800441d2"
  end
  version "2024.12.19"
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
