require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.11-darwin-x64.tar.gz"
    sha256 "13d4732f9f547ee3e8cfcd69b617beb501f2ffad8c93f4a6cd93f1cf320a3634"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.11-darwin-arm64.tar.gz"
      sha256 "455179a22e0d8214b962b4070ba28ba21f5e21091ab5f8bf4a4914e58c6c8bec"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.11-linux-x64.tar.gz"
    sha256 "9b955d1168430491eff672505b212c85cd75592b389904292001d9d9692b25f1"
  end
  version "2024.9.11"
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
