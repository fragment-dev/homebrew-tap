require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.18-darwin-x64.tar.gz"
    sha256 "19382ff1facfd7f1367b2a5d23e6f967f4744a25f9841c9552c512d92935c6aa"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.18-darwin-arm64.tar.gz"
      sha256 "f9b46027cf16546b8faddeb12b7fd1b287f1b907d33e633dee1bcde68261250c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.18-linux-x64.tar.gz"
    sha256 "71467a5c6dc17ee071b59c1c3024ad82afc024394ff3e7d222490dede95297e8"
  end
  version "2024.9.18"
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
