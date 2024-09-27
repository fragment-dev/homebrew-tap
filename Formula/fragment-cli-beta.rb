require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5627.0.0-darwin-x64.tar.gz"
    sha256 "1fc4152f45471bf955d7bdeff227f83c84458ba82c4c492d0c40235b73a0ee13"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5627.0.0-darwin-arm64.tar.gz"
      sha256 "8597c2af87a41c17d6f3a3ec04fb94fa625e2bf5f6802ff536642ad19b470b72"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5627.0.0-linux-x64.tar.gz"
    sha256 "8a9de9eb69e2300d6f922736ea318d6917dec4e94bddbfb5389b2fdfa048a6c6"
  end
  version "5627.0.0"
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
