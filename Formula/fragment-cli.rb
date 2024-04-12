require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.11-darwin-x64.tar.gz"
    sha256 "3eb820c3450d8e2d0cee6a58eaf996716bdb98fd0669ad5b3988bbc2ec5ac6ec"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.11-darwin-arm64.tar.gz"
      sha256 "e269226800cf36c89497b3b9130b0758c4fc8b3ab412d97d8bf8125e4b815762"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.11-linux-x64.tar.gz"
    sha256 "d9902e7ba9ca8c109f822960bc4e8d74f13ddeaf9795af9c75516fe9fe3413af"
  end
  version "2024.4.11"
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
