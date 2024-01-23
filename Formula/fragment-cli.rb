require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.23-darwin-x64.tar.gz"
    sha256 "2915f92fddebf106e00680531537f307171b88b6cf40b731ae12bda0b0df70da"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.23-darwin-arm64.tar.gz"
      sha256 "9a4bbfa3d18297e72c0cffbbfc80eff354d9c597c02147984977b93e359c632d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.23-linux-x64.tar.gz"
    sha256 "31b997bd5f9283bf29aee78089242d442464ac21008bc4c681023d076c10a4e0"
  end
  version "2024.1.23"
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
