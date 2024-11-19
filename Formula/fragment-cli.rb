require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.19-darwin-x64.tar.gz"
    sha256 "b29a909c104ccfb963a67ed1eeb5bdf1dac93a4646c0e37aea45c141752b7cd2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.19-darwin-arm64.tar.gz"
      sha256 "7de1dca8b526f6992bbdac5938a94e552d34d73d2b25e51b12c412ef955e59d9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.19-linux-x64.tar.gz"
    sha256 "9d18f6d22140b8b1c2243160849f07d8db836fb06f5a53b81fa48f3ae2948ca7"
  end
  version "2024.11.19"
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
