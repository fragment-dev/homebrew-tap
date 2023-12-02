require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.1-darwin-x64.tar.gz"
    sha256 "6671640c17ccae1049a20ecc3454662c1b4b262242852ad1a41b3e97cd613a7b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.1-darwin-arm64.tar.gz"
      sha256 "356d110c47e91723fc26310d2cd807eeb6cab95c9f977dd35084a90c5413ce7f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.1-linux-x64.tar.gz"
    sha256 "f225f55592fc47e42fb7cc88e2ba89d42157d2f37328d937916437f6d695658c"
  end
  version "2023.12.1"
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
