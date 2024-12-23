require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.22-darwin-x64.tar.gz"
    sha256 "49a06957e54082730fdc71c042c238d618356bdd7f58b2bd239e5e2e408100e3"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.22-darwin-arm64.tar.gz"
      sha256 "b30237ef90d32ec1330204ebd922cf79de69d941f6a6cea374c0bbc82dd1a76a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.22-linux-x64.tar.gz"
    sha256 "d934006447d5375b16d6f388c53f004b0351ffebf0d9a35af6994d88734521ab"
  end
  version "2024.12.22"
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
