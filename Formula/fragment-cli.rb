require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.23-darwin-x64.tar.gz"
    sha256 "a4736a979d21b07fc2fec01438b085a73bf9d604b081cc4c6626b304fe45d72a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.23-darwin-arm64.tar.gz"
      sha256 "1a782a84655ad76ebc63cbc3e639bbdd79e64b471f16cec05a4bc733f35cefd2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.23-linux-x64.tar.gz"
    sha256 "3332bfc49e73521796e90b6485d7a075b5000550ec67a6e678f57db553deb071"
  end
  version "2024.4.23"
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
