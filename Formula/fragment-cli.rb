require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.19-2-darwin-x64.tar.gz"
    sha256 "7d2435d477d31c854c2bda94a36ba865ff24ea1d17463d58394d10facde99f2b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.19-2-darwin-arm64.tar.gz"
      sha256 "5f927eb1a394476abddab17dbd0e3802a68609c31a634b2a9f889808995a4954"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.19-2-linux-x64.tar.gz"
    sha256 "0deb65b107537342e269943d0db3fba9106d73043302fd5123317bf04c8b8771"
  end
  version "2024.2.19-2"
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
