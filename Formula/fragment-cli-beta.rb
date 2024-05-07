require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5003.0.0-darwin-x64.tar.gz"
    sha256 "2f21c844fb1e1c37899eb86d80eb9e73c4248436da066c6e53da462747ebad13"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5003.0.0-darwin-arm64.tar.gz"
      sha256 "da8a29f8d3d0f7d820b2cdddb7d0ab51b1a0df966cac7a9aa8d6556e2c2d673b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5003.0.0-linux-x64.tar.gz"
    sha256 "b630933f0769deeeed9e34941fde89bb29e1f9f4aa0ca69d369026295b2ee935"
  end
  version "5003.0.0"
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
