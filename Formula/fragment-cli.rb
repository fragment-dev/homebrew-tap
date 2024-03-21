require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.21-darwin-x64.tar.gz"
    sha256 "4e18227b4fbdf2d4636bd4c69d8b72c66d696939083ec0d041363661925a822e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.21-darwin-arm64.tar.gz"
      sha256 "36c8abeed49349828fce952a3e89a9eca2275e691fe0bf2761853aa5e0422299"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.21-linux-x64.tar.gz"
    sha256 "482ce68823e9f15f510541447d34abc2791d0b5a10ab7609057b4b884745556f"
  end
  version "2024.3.21"
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
