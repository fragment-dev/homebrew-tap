require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.6-darwin-x64.tar.gz"
    sha256 "0ca8990e67bddea2c18ef11c31b9f7be11e7518193eec091a1b8ff0b9d15844b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.6-darwin-arm64.tar.gz"
      sha256 "292e5b99a509039d38462934d61375174db779e0b84e35633d4e2cd4582de049"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.6-linux-x64.tar.gz"
    sha256 "3126dfe3c41c5b284bba2bfe55a79c45ff1571f1ebdfa5e0405b40cf9acc7ed4"
  end
  version "2024.3.6"
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
