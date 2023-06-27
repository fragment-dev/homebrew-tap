require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.26-3-darwin-x64.tar.gz"
    sha256 "21fdc49c0d44dc3d774e6138af8f1691cd5e585d49834e34f0f6a638746d7ca4"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.26-3-darwin-arm64.tar.gz"
      sha256 "6d775a4ac77c8c84ebaffdde248bd15a18540054951a3cdc3d00e20ffb978dae"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.26-3-linux-x64.tar.gz"
    sha256 "b9bb73d2b43b134e70c63cad27a78f84888c8fdd1b7ab44052fb5817df31ca18"
  end
  version "2023.6.26-3"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
