require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.10-darwin-x64.tar.gz"
    sha256 "95f115978c59363c2a91e7195c6a9f42801c35d1c7aa0bc85e3467cbf264f539"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.10-darwin-arm64.tar.gz"
      sha256 "44db7ee94e4410ce3b87138120cfcbd20d017f36f30504e894737429c205536f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.10-linux-x64.tar.gz"
    sha256 "a03e8f226d1f22fbc3c72ba8ed35d8c312bcf5514ba92bb73f834e273618723a"
  end
  version "2023.11.10"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
