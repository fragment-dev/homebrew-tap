require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.14-darwin-x64.tar.gz"
    sha256 "acf7b5410647f0607cc62d1dfe79b845bd1afe4b79ce25f1486d8f2b15420823"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.14-darwin-arm64.tar.gz"
      sha256 "17a92876fe30731177d2e2349098a8731edb19cf97ea254782ed9414580c65e9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.14-linux-x64.tar.gz"
    sha256 "44556a08f7c7fccc697278f22d2d43e06b0b16dbcf6c12202c1db28a6bae048c"
  end
  version "2025.1.14"
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
