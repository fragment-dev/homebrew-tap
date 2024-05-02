require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.2-2-darwin-x64.tar.gz"
    sha256 "8558d3c01eb3395cc9f52ff68f0d36ce64a95d4aac41b2fede008e8fd4b4db81"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.2-2-darwin-arm64.tar.gz"
      sha256 "326c73ae2e1e38c05da3334bc5c07d501a8ddd02fe52fea2f6b25aea30686366"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.2-2-linux-x64.tar.gz"
    sha256 "538523fd65f495319549ddad185ef202ed9aa6f8a4c39cac872335f623566fd9"
  end
  version "2024.5.2-2"
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
