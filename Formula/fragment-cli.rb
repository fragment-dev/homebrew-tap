require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.4-darwin-x64.tar.gz"
    sha256 "11eb945aad0cbf8b781ca66298cd9ae6cad793f70ce33574a0869acd0957d583"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.4-darwin-arm64.tar.gz"
      sha256 "ed76a0dd2937f6ca97e87c1e966636fdd331214d399a3c064bd4c20cb104a0c0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.4-linux-x64.tar.gz"
    sha256 "dc0eb80bcf65816573e04f9c257e0b867dbec02d3de7ed4377727fd2eed1d1e6"
  end
  version "2023.10.4"
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
