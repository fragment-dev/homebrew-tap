require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3946.0.0-darwin-x64.tar.gz"
    sha256 "f9a204cf80a90be7a5cd5fedb948efaa2af90e6f04e1fe1ef920c0c6fde864f5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3946.0.0-darwin-arm64.tar.gz"
      sha256 "897eca28561a5b7e93720c686ab5fa09a014082006475e5a3f71b0c7cbc7731c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3946.0.0-linux-x64.tar.gz"
    sha256 "1c581de7ba09342cc1b3e100310a137627ccea13be51ba08a7136d7ddb78a45d"
  end
  version "3946.0.0"
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
