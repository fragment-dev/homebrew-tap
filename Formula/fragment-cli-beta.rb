require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3437.0.0-darwin-x64.tar.gz"
    sha256 "cf9e6f4a00d2fc515645bb83b5d7a57105d90f45f0488dc10de2dd3a5fac3ee9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3437.0.0-darwin-arm64.tar.gz"
      sha256 "a7b20d0852559d460bf47ff0b305474dae0f349101de26cb07980fc5aa737b0d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3437.0.0-linux-x64.tar.gz"
    sha256 "4c412b345a029e80e93c58b01e04a36dad44f9c646152e66d1fa4895b4b2f17f"
  end
  version "3437.0.0"
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
