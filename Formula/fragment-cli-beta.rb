require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2916.0.0-darwin-x64.tar.gz"
    sha256 "7f0fb46f3399635d1fc35b41de3b0ce167b0f67517d8215c76ed0b3040cac309"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2916.0.0-darwin-arm64.tar.gz"
      sha256 "8477821156893e4480f008abbb1b5413bd9ad9e9a7c5a3acae574c9995ffd20e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2916.0.0-linux-x64.tar.gz"
    sha256 "e96ae77162882782f40e00e4952c6ecf983684601cf854375c1430104a0403d8"
  end
  version "2916.0.0"
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
