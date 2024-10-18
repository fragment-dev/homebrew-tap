require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.17-1-darwin-x64.tar.gz"
    sha256 "a62090c5095bc3f307e74c1fe3f7b36b7809a8dbcffc44e028d57bdc5ac1db75"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.17-1-darwin-arm64.tar.gz"
      sha256 "23970c8a98c10b51e9d7d931c2230a483a738cb606a10a0afe0ce3d4d8f9de59"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.17-1-linux-x64.tar.gz"
    sha256 "8cbe54597da9740d092395670bf06116778e8c9b56c44b46cb4eeb9c057f773d"
  end
  version "2024.10.17-1"
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
