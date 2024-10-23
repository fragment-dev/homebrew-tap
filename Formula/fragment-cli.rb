require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.22-darwin-x64.tar.gz"
    sha256 "71832027f088f51f1d67334e228a516e5d690a31460e2005d8c6ae3d39fa6f75"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.22-darwin-arm64.tar.gz"
      sha256 "b5e86869d85846d1598244d16224d7811c8bdb51fd03400fd5039011e3232167"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.22-linux-x64.tar.gz"
    sha256 "0ab5332ebd0f31ddb696a1e0a780c9e60fb8b8eb11fdb2f9cb46ed5840a55124"
  end
  version "2024.10.22"
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
