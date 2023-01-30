require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.1.27-darwin-x64.tar.gz"
    sha256 "b5518ae909501441dd756b4957ab3c2f027cb48116d2632f1c7165b2ba9cf1fd"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.1.27-darwin-arm64.tar.gz"
      sha256 "4f12d555ecfe6b3c524d7bad323417488b2ccbf810abf739a70e0ad29de490d6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.1.27-linux-x64.tar.gz"
    sha256 "ea90cbc99c98bff60a07be3115890eeed0488f36df8c81d5d0166522bf0e5584"
  end
  version "2023.1.27"
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
