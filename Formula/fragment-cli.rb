require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.2-2-darwin-x64.tar.gz"
    sha256 "fb1f0c0d658bc6a28421e1cfb530672eeda71c05209bf0d28432d366be4b78a6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.2-2-darwin-arm64.tar.gz"
      sha256 "1701da0ca3aef4577a8ea1e40b766cd796a8e1a26e5ec3ec1aa747b084c6597e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.2-2-linux-x64.tar.gz"
    sha256 "b3c1d32e9747b812247bec1987e695d580817707c12a84417f63f754dd45eda0"
  end
  version "2024.4.2-2"
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
