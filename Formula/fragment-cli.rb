require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.26-darwin-x64.tar.gz"
    sha256 "45517f9c755400be2dec9800933d260c854ac0bc953aa8015287e4c186593f08"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.26-darwin-arm64.tar.gz"
      sha256 "08803b329dcd1fd81c5701ef33cd21cfb07c42a95b81ae67bac8ae75c9092496"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.26-linux-x64.tar.gz"
    sha256 "bfe4107332085e76a4868ed8e91636a2802087811101109e71acb41efb5002eb"
  end
  version "2023.7.26"
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
