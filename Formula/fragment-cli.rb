require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.4-darwin-x64.tar.gz"
    sha256 "8ace0d36a01136dc358b57da6b9a02594338e472cceb288585118f04eadc3da9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.4-darwin-arm64.tar.gz"
      sha256 "5773b4de282e7b725d17967996882c2cec4faae7457e7dfe14eb303d0ca9f458"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.4-linux-x64.tar.gz"
    sha256 "a22657a70c4303576804c11850e003fe0bb3144043244d5a730a32e69c8b5010"
  end
  version "2024.12.4"
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
