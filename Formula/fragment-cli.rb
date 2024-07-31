require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.30-1-darwin-x64.tar.gz"
    sha256 "a09807556222fd7f617428d4f721d084d5e4490d917402e2357abc34cbb66a1e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.30-1-darwin-arm64.tar.gz"
      sha256 "ce142a236abc096452b8faaca1c3b734fc3306fa4fd4ca23c05ea2a1791ec4ee"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.30-1-linux-x64.tar.gz"
    sha256 "8553896a5586652f2d388743fee030dddc282a12e0fce1a01adbbed4d0fe0bf9"
  end
  version "2024.7.30-1"
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
