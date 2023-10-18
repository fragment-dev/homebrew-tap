require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.17-2-darwin-x64.tar.gz"
    sha256 "b0716b34254182a8373840d93188dfe70fc870efc54d93242ff629e58214fd69"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.17-2-darwin-arm64.tar.gz"
      sha256 "fd0057b49581d42f39974aab660140b61fff10af99f5e46d7e1fb49610832eaf"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.17-2-linux-x64.tar.gz"
    sha256 "28bed426abed01aed060dc1c3aa4329aba71659353dbd82da90db2cc74910557"
  end
  version "2023.10.17-2"
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
