require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.5-darwin-x64.tar.gz"
    sha256 "8ccf2dc0139c3432e60be83dcb233d51bed2df956ad752af1d72127c673d76ec"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.5-darwin-arm64.tar.gz"
      sha256 "fde5fad5c892662444ceb89b8547a6a235e40ed7db60caac2f72a103df8b4618"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.5-linux-x64.tar.gz"
    sha256 "19a8c82e10de6d9a1e6cef2a5f209ac5b2751560fd14924139faa9fd954b9b40"
  end
  version "2023.9.5"
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
