require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.6-darwin-x64.tar.gz"
    sha256 "41fe116e708e4c07bc08cef4fd8f08ad620147ef801ca7771cb3395a38785530"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.6-darwin-arm64.tar.gz"
      sha256 "1778e8342b05ec4d49ac0519270e78189baa766f6cff105c77716e179c6d075e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.6-linux-x64.tar.gz"
    sha256 "a2df59d7a8ed401a00cc67d192ef101bb242c871e9eefc24c517b178b2cce588"
  end
  version "2023.7.6"
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
