require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.12-darwin-x64.tar.gz"
    sha256 "37411e241e45a47691403ac8677aa82f6e9a41b2824a474178d078ba0ec5897c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.12-darwin-arm64.tar.gz"
      sha256 "50fd24a2d0af26867794589ef157e87147670f9a3ad066c2c7305d1e3b0892af"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.12-linux-x64.tar.gz"
    sha256 "85ba24109392b8552ea68311d47fa3c35048c5dadec0fcd6aa67471262c29596"
  end
  version "2023.7.12"
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
