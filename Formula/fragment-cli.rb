require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.13-darwin-x64.tar.gz"
    sha256 "bab9da5c880bf01ba991039d4c04f490e7cc2dca292e3b1efaef1339e0427849"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.13-darwin-arm64.tar.gz"
      sha256 "5c4211a1ce2695fa24ae66f0bd7e19ebd9cb40a94355baa337be68a233cd5ce7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.13-linux-x64.tar.gz"
    sha256 "f540df818c73ef31f96e970484ae5b60097db12b96f7e9c323c065dfae6d8fd2"
  end
  version "2024.5.13"
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
