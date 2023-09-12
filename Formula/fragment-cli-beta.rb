require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3532.0.0-darwin-x64.tar.gz"
    sha256 "ea462a7892079b2f14ec74d62039e400bc50d0441b8222ebb0c4a3b9e5db5845"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3532.0.0-darwin-arm64.tar.gz"
      sha256 "bdcbbd567be2493fd5ade643453ef865be66e0b3afb1497c8ad2ae4fa657a173"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3532.0.0-linux-x64.tar.gz"
    sha256 "dcf6b3fc450bd2a0d1893b418020c203f107364bab0caf7bf86421db505d51b7"
  end
  version "3532.0.0"
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
