require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.27-darwin-x64.tar.gz"
    sha256 "ed03779163649629a154ff887279f1c8949158040fc3e092c8aecc414d614e81"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.27-darwin-arm64.tar.gz"
      sha256 "e116b6e3472d3ec78ab627c8e263f405cd5552380a06564b679b271787030485"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.27-linux-x64.tar.gz"
    sha256 "c7c197b265fa39bb092d6649d2e0c42decfc01688170c9bdc335f09c5473c6f8"
  end
  version "2024.5.27"
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
