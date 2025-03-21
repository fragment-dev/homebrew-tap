require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.3.21-darwin-x64.tar.gz"
    sha256 "766e82d962ec200de39cc65f7a477c18fb5612d3c2217386b071f21d1a16fb9f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.3.21-darwin-arm64.tar.gz"
      sha256 "9bf4249bcf4bba92d7197a879fd9d71bf1c242d0dcd0b9f97a5e25c39d789ac6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.3.21-linux-x64.tar.gz"
    sha256 "e64654a17e1fb60c12916b24870339fa10f84d7f283513ffd2df0622a4c8f3ff"
  end
  version "2025.3.21"
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
