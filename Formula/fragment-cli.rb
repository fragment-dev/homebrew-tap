require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.5-3-darwin-x64.tar.gz"
    sha256 "0a44dc27b092f32dd38c25e88c74189e22b3af38dc5500d2b495fc909e0af86d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.5-3-darwin-arm64.tar.gz"
      sha256 "0ae72b974767553672fb6541db721ada765eb8ef78a2e3e7cfab55847e2f7304"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.5-3-linux-x64.tar.gz"
    sha256 "fa8f6414af927a5fe17281362ba5c1821eb50de0f14721662bb22daedd458d6e"
  end
  version "2023.5.5-3"
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
