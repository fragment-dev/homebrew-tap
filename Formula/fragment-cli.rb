require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.18-darwin-x64.tar.gz"
    sha256 "16e6368ea63a8b9a1e1c7859f2d4ed79ce3564abcb1c990ca8790cf98f85df63"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.18-darwin-arm64.tar.gz"
      sha256 "40768b0d895726dfa7889275c47c0617397b32a83be9aa27a32b0179a3b8b40f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.18-linux-x64.tar.gz"
    sha256 "609c380a780bc395defceeb03590e3b3d2156186fa2254ca99f62fae54fc6948"
  end
  version "2024.1.18"
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
