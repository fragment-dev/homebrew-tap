require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.29-darwin-x64.tar.gz"
    sha256 "f6479fe40390cfc1f2191784f94212ee88f30c0dc99cf2dca37114ebb452b809"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.29-darwin-arm64.tar.gz"
      sha256 "3d42705eb38ca886f0afec8483f8df26c1f4f09a82399efe43c77bb4d72578df"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.29-linux-x64.tar.gz"
    sha256 "aed0b05ef9338cfe8f6610f6f85c097a56af7f269b423c38798a6ef918763371"
  end
  version "2024.1.29"
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
