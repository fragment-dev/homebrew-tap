require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3678.0.0-darwin-x64.tar.gz"
    sha256 "b3b3e37a506be5d0e418bc3d8ad59eaad67650f2a67c8a08f167582f2804f9bd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3678.0.0-darwin-arm64.tar.gz"
      sha256 "34d3fbf0940ef29770db4ceab869fe4bfcbafb36374238b5da1e72fa689e6d33"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3678.0.0-linux-x64.tar.gz"
    sha256 "1b71b813bf53cdc36e40cb0090165b2a5fdaf8c072d3c5ac6f80521c300f592c"
  end
  version "3678.0.0"
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
