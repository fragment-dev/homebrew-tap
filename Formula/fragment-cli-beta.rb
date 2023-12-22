require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4200.0.0-darwin-x64.tar.gz"
    sha256 "17b32295f6db6643ae3c57dcb0d0d376e60d978cb956b00827d373a8439065ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4200.0.0-darwin-arm64.tar.gz"
      sha256 "a60349b7385e3b072d1ebcbda34704a632a4931462ff48521817aa23c68f3f3e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4200.0.0-linux-x64.tar.gz"
    sha256 "521e2ca60d5f4925daf5024cc8eeb656152f1a60fd2451a28a6e8b066987bdce"
  end
  version "4200.0.0"
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
