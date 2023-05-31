require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.31-darwin-x64.tar.gz"
    sha256 "f23779581079d1bb8a64629b4623694741f8110a20ddb0cc7aad4716ae20c29e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.31-darwin-arm64.tar.gz"
      sha256 "d3811b3ec42b38fbc1ee45da5d1089302ebdf3690cb76333ef9d1507d2372734"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.31-linux-x64.tar.gz"
    sha256 "071174cd7827f0bc786d0938e4e5eba688aac5368b9e2c63453cdc8f142dca50"
  end
  version "2023.5.31"
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
