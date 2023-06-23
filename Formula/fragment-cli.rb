require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.23-darwin-x64.tar.gz"
    sha256 "93cc74501f5236392382ab09d9025c58c5029c8e943777f684b0dca7138620bc"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.23-darwin-arm64.tar.gz"
      sha256 "3bc568d0c613ecd8799547954ef8554ca494367147ca6bc17a1ef1ad357f18b7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.23-linux-x64.tar.gz"
    sha256 "44ecb16e68998e7190c184839416af8509d5e92fd259bbd7dfe722a60079e42d"
  end
  version "2023.6.23"
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
