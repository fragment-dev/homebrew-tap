require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-darwin-x64.tar.gz"
    sha256 "94ca1d6e570ad4d929e0c81170540f6f577ee839da8a046071e8552c7dbc8e7a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-darwin-arm64.tar.gz"
      sha256 "2f72e1acbddfe26994995e22c79b8ff81804072d1c4833ddfca3dd1bc56f089e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-linux-x64.tar.gz"
    sha256 "f0cf1ac0c7a787c994c2f8ac7bfee5d37273e0e5faa711d9c56a2a6164524867"
  end
  version "2024.12.20"
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
