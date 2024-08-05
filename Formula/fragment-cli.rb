require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.5-darwin-x64.tar.gz"
    sha256 "ce2b4c3e00af9f3a39e1c838473f93bd2220f32d694baadc4545d0b89c7338db"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.5-darwin-arm64.tar.gz"
      sha256 "417deb9f8d99a2df520243a424232297c4ea0aaa6cd54579f4a11d9f9f63d077"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.5-linux-x64.tar.gz"
    sha256 "92b989d2d9adff9fd735c05737150815803454a55512c68da6bb95d15bf086ef"
  end
  version "2024.8.5"
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
