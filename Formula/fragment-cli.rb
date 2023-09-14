require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.14-darwin-x64.tar.gz"
    sha256 "4e81fc416435ed2b5c4a443271ff1516490f3a80309e8babc37a4590359978a2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.14-darwin-arm64.tar.gz"
      sha256 "e2f63a0d0d2cbc9372bf87c33955f2541871cf7dbfc59effe7b978ccf867c9e3"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.14-linux-x64.tar.gz"
    sha256 "ecef4fcc9a35a734203f501d3d84f39d40b098dc4642041a975f8a623777177e"
  end
  version "2023.9.14"
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
