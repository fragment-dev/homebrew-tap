require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5874.0.0-darwin-x64.tar.gz"
    sha256 "3a378f0ea6fd08103618b291ac988f212f75c0767927af16dc088c1c34b9f035"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5874.0.0-darwin-arm64.tar.gz"
      sha256 "780208f6fb2dea4bc5991687299cc883151177dfd58acd2711075df76ae13223"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5874.0.0-linux-x64.tar.gz"
    sha256 "572fa39696249e25608b767a42c29cc092400a3897ccbf202bca23e9c1e804db"
  end
  version "5874.0.0"
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
