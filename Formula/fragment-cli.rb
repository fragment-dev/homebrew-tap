require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.13-1-darwin-x64.tar.gz"
    sha256 "5f91236d209d902e75c074ffefb9bb5fe7abea563e81027b550c1565fa0fd398"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.13-1-darwin-arm64.tar.gz"
      sha256 "d23e840e195d39eb5d9039729dec9774ea6e1cce601cb77aa97d9cdc2a3c063a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.13-1-linux-x64.tar.gz"
    sha256 "89248b7ad3b501d5f10ecf159923b22def67acc4fd2fb7cdf0ca1cdc529ca0b7"
  end
  version "2023.12.13-1"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
