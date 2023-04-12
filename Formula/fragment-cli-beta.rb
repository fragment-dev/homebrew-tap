require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2431.0.0-darwin-x64.tar.gz"
    sha256 "9a94209cd3457a029f0bd39e8d30f056c1e4225da9d0f0e5fdb52b057f1b3dee"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2431.0.0-darwin-arm64.tar.gz"
      sha256 "2e469e962f5a5085dfbd7957d60f121248b68594fec30fc41d922030ac3fef97"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2431.0.0-linux-x64.tar.gz"
    sha256 "9a0c0c4f6424ccb0d7af635b21d067c9e2b4c07cc42fbdb4f8ee677fde1559fd"
  end
  version "2431.0.0"
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
