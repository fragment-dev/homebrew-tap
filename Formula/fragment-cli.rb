require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.2-1-darwin-x64.tar.gz"
    sha256 "0202da3bae4c649d517f2b1aad55ac49dbcc50b3468ed25c861ec3bf6bf86551"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.2-1-darwin-arm64.tar.gz"
      sha256 "2cfe74034e71c45140b8d06ed5bcd9b847fc6d63a1ae87854d68f09721a3ed96"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.2-1-linux-x64.tar.gz"
    sha256 "4fa0c2710abf1d432417b43b8fda32353fe720a0540053088543ed410c40b764"
  end
  version "2023.5.2-1"
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
