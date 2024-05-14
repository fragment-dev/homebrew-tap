require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5044.0.0-darwin-x64.tar.gz"
    sha256 "e3d7eb2587d897408289af8b3e16a68d55eff221c0683df31b20514481b7e89e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5044.0.0-darwin-arm64.tar.gz"
      sha256 "48980ac13054cb00e82bb510628089d61559801332ff76250ec3dea705a11867"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5044.0.0-linux-x64.tar.gz"
    sha256 "3ea46c790b5b29762b42619c1437016ff2fa14283899fea0119222d034d80e46"
  end
  version "5044.0.0"
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
