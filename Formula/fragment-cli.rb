require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.23-darwin-x64.tar.gz"
    sha256 "e861ee538f39d2ecc2f0d8ca345442ea0260533271db4a83b5e406cfb30d1f97"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.23-darwin-arm64.tar.gz"
      sha256 "c565253a76417f90cc8dfa315c97d138abbad838e134e54a8609d89eb1fbaaf1"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.23-linux-x64.tar.gz"
    sha256 "efc0b1c0284574bb9b7bdb1878aba85f50467eac37fc9a4041b093d587c6d0fd"
  end
  version "2024.12.23"
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
