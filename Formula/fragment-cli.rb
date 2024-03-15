require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.15-darwin-x64.tar.gz"
    sha256 "29eba846518013a3095a9b4995af46ac06af138584d607ba48b3266b07a36b4c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.15-darwin-arm64.tar.gz"
      sha256 "9dd0b917d38cbe1da4217e170d67c54e8957313dee9ee41d22917599bbd83c43"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.15-linux-x64.tar.gz"
    sha256 "019366336cfbc7197643209129b7ba19e6c64f4e26959c4fb21936faebca1b70"
  end
  version "2024.3.15"
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
