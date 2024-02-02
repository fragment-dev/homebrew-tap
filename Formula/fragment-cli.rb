require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.2-darwin-x64.tar.gz"
    sha256 "32e4991a1166c37faecc177b00aa4ecae947baffe9548340a565e6abafd097ef"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.2-darwin-arm64.tar.gz"
      sha256 "30f2b030d0f341c7427388a090d674a24740c6a4af9898960988315c1733f34f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.2-linux-x64.tar.gz"
    sha256 "096c7ecd9f1ca56d86548c616f7650e51df917c8bc60b58e9248301644cc024d"
  end
  version "2024.2.2"
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
