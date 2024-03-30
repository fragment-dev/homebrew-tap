require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.29-1-darwin-x64.tar.gz"
    sha256 "32ba66e7d0e2dbe36cc906443fb3d9ef4162736aa91e7f4fc6f25786801fdb2a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.29-1-darwin-arm64.tar.gz"
      sha256 "1638b5ebcddd69130353cf43799c501419da08beea25110242a35ada93da1097"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.29-1-linux-x64.tar.gz"
    sha256 "0900a3cd115cc5bd19eb58501ad4fa0f0cfbb1813a0625c81c5b059918866922"
  end
  version "2024.3.29-1"
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
