require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.14-3-darwin-x64.tar.gz"
    sha256 "db606e8ffc0847631c250426846ff552877f3112684db2bd53391dcc7fa5cb9f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.14-3-darwin-arm64.tar.gz"
      sha256 "d91d6058a9e3234df7d435d33d858f3ae7e1efa2810158dab3951de13428ab12"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.14-3-linux-x64.tar.gz"
    sha256 "ff8c90538cff5e8aec797cf1169ae0c3de6cfbf0f13bb2bdd217b6b1bda091ad"
  end
  version "2024.5.14-3"
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
