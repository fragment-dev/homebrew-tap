require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.15-2-darwin-x64.tar.gz"
    sha256 "79759c536cf79735c6a5f493b7499bd49ed70b60d6ef1998fb012897d528475f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.15-2-darwin-arm64.tar.gz"
      sha256 "67e176b7e376f3aa2b33c3af060727a1ab298b39e952b109029ed795fd27b29c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.15-2-linux-x64.tar.gz"
    sha256 "def2e97fc4b537de805dfbe9768718746962314f57e0bcf432e6b01bd081b51b"
  end
  version "2024.8.15-2"
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
