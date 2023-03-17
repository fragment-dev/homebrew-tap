require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.17-darwin-x64.tar.gz"
    sha256 "71403e590568355a5198baf0ca3feecfb1744129848b072f9065c05c23098fd8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.17-darwin-arm64.tar.gz"
      sha256 "195c742edfd78801bbc635eb34880b9f16434a6100e6bc14339befce61dc7f61"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.17-linux-x64.tar.gz"
    sha256 "ebac62b0e13a949948c268b12781122aa8bf7e60acbb51bce146cbb5e7c8dad6"
  end
  version "2023.3.17"
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
