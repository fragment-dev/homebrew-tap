require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.3-darwin-x64.tar.gz"
    sha256 "b1a5d36d074e3dbb4b0871e90c03b5389030ea836fb884754780568c5de4572b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.3-darwin-arm64.tar.gz"
      sha256 "55f1d6cdf0fa5051d60fd9050a64188ffbe1392ddb4887e41884607e4c4ff97e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.3-linux-x64.tar.gz"
    sha256 "55c4322269fc813bc6d18aeb519f63681c8ddb21e614a42b3041112fcc4b944c"
  end
  version "2024.12.3"
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
