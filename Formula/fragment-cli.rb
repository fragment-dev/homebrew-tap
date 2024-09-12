require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.11-1-darwin-x64.tar.gz"
    sha256 "02993ca4ee67bd3a6649f7aa0534881da78072ee65dc94703b486295ff61f389"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.11-1-darwin-arm64.tar.gz"
      sha256 "8ad50fc018a968bc32ad1c5ada002d5fc70e2998de6589f5b0f693e8163735e2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.11-1-linux-x64.tar.gz"
    sha256 "74ea3bec87b04c132d628e0c78e22652e254b6b25c48afabc2531aedbd65a31f"
  end
  version "2024.9.11-1"
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
