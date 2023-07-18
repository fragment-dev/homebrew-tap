require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3108.0.0-darwin-x64.tar.gz"
    sha256 "83ed3437b950d992d48c117b297b2ede5750190ec51e35370d0ef8f2a74059fb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3108.0.0-darwin-arm64.tar.gz"
      sha256 "c0b01b3a258ccd40458e9570df9aea169bb0c6514e4b80584b46f7d63c14bd3c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3108.0.0-linux-x64.tar.gz"
    sha256 "af8d2dca20d9907acefb535a5b5710802ffb6f1662ba46ccc847406f044b3d26"
  end
  version "3108.0.0"
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
