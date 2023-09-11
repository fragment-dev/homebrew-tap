require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.8-1-darwin-x64.tar.gz"
    sha256 "7db03e4e34aae2e009027589c8952dfb1f089f16c088bddc11d7fec54b204ba2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.8-1-darwin-arm64.tar.gz"
      sha256 "cdf5fa9da8de197927328ff591fd26a08bc63cf6981cecfa0674d89689e4d12f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.8-1-linux-x64.tar.gz"
    sha256 "53b1c7ccdda0a3039388888394e8228df25275bd9595c413f60b8fe137e1f61f"
  end
  version "2023.9.8-1"
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
