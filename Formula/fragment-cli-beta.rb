require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3712.0.0-darwin-x64.tar.gz"
    sha256 "066a2f76b2dad55f2c13ac1c08e18ff108915608876e97ebd0478bb91aeba382"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3712.0.0-darwin-arm64.tar.gz"
      sha256 "532d99806c3daf0b40f97e1fb2480e6cf54047eaa0120cee8a6af38fafeaabd1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3712.0.0-linux-x64.tar.gz"
    sha256 "785811cd32a08cb61817067576eed6b1097313ffde109d186ddf0d2e6ccd723a"
  end
  version "3712.0.0"
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
