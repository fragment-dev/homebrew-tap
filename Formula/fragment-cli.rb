require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.24-1-darwin-x64.tar.gz"
    sha256 "5f0793cd624d3c2fa0d83e4fd65e60098473fdcd10ccbc53d2ecb3953e17d23a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.24-1-darwin-arm64.tar.gz"
      sha256 "40dea5e51bf83056935e28587874402b3773cc45c1be6287ad6490177eb82871"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.24-1-linux-x64.tar.gz"
    sha256 "1f4959dd94f5004b516342b309ef2241a1e06f2b7aa52677dd3f193179755755"
  end
  version "2024.9.24-1"
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
