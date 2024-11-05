require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.5-darwin-x64.tar.gz"
    sha256 "301616f424a32e23d5f8c2280fd87428dfd781cb9790e7832a75127f935f01b8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.5-darwin-arm64.tar.gz"
      sha256 "095cb11d8b0c3d77fb154eb1e21742751bb2a37c9b25aef32241b2187c8ed9b7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.5-linux-x64.tar.gz"
    sha256 "aee3d6af6dbaff5c5e2b17972631229b07599d651a65dd29dd8446ecd06ece27"
  end
  version "2024.11.5"
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
