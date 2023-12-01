require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.1-darwin-x64.tar.gz"
    sha256 "61d7fddb246c0170afdfa5468b498670083cd1388c166b59c965b271433a3f9a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.1-darwin-arm64.tar.gz"
      sha256 "c622e01ccbba06dea087f9fc69f87ff3a1ef50976e410111e83689a226681175"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.1-linux-x64.tar.gz"
    sha256 "29185f10b6b2deeeb357f57c952bd21283c69c4df9b45f82c1a7f608668f9a89"
  end
  version "2023.12.1"
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
