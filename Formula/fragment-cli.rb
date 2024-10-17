require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.16-darwin-x64.tar.gz"
    sha256 "c0469fa675639773b312c298a25f3163d9053e74852bee6c701529da756c7ec5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.16-darwin-arm64.tar.gz"
      sha256 "ee4744f217db841b65b84ac0f752a26c8b4cb4d536b0d88370d2c84518d93501"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.16-linux-x64.tar.gz"
    sha256 "3eeab2154b746d5bab19943199aedd203b2dc84cd9b1570fc79c44156b92e65d"
  end
  version "2024.10.16"
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
