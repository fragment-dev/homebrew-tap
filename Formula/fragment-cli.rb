require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.3-darwin-x64.tar.gz"
    sha256 "b416800873c16fb08b4139e388624aee9a9801a13df13a186ca396fa849b9051"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.3-darwin-arm64.tar.gz"
      sha256 "d086788ba409646174d4b39f1f6b7e7f6c3b66ea5511f633e45f0dcc48c621a6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.3-linux-x64.tar.gz"
    sha256 "2538151e29460d2b8a5ba2f8f183cebcde73cbde3732c404d81af57fb0ff5c57"
  end
  version "2023.3.3"
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
