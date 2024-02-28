require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.28-darwin-x64.tar.gz"
    sha256 "1773001232efb329417a292bd4e040ce3d1661073a90df8fedd326f9f1b85833"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.28-darwin-arm64.tar.gz"
      sha256 "e1bad19ba77ee826e782210b5b030b00482b04f7ca8873526d58af7c6ce20461"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.28-linux-x64.tar.gz"
    sha256 "d06cce97577e21d854ba25ef7d046ae2050d661adb1c25f2dd3f4e3ec9cd628f"
  end
  version "2024.2.28"
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
