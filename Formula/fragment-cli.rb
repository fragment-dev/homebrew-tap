require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.24-darwin-x64.tar.gz"
    sha256 "1e3f8d0b8e20b463114728f96b767a1e9b4d37b4d279663ac541ad3525762712"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.24-darwin-arm64.tar.gz"
      sha256 "21ed11373b3751ba6570a387e1ea98eea405ff2b9956eef5808f7ba40634822a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.24-linux-x64.tar.gz"
    sha256 "34714075094028e77ea9f4bf7b929a147494c0a9ff8910c604b7705aeab17818"
  end
  version "2024.9.24"
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
