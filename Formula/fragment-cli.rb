require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.22-darwin-x64.tar.gz"
    sha256 "3633b05a3bb7cdca3a6538525aaf804af9a79366f1fa285fa2c038ede9f53b74"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.22-darwin-arm64.tar.gz"
      sha256 "a501cd728239055e2cfc807a063c715b832cb7b025e62005fb228b00147c5dba"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.22-linux-x64.tar.gz"
    sha256 "23d85b8c95bcc452c48f471824156c519a4398f47bc328dc91c8b72961fcec50"
  end
  version "2024.5.22"
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
