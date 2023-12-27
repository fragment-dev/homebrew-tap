require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4224.0.0-darwin-x64.tar.gz"
    sha256 "b4a7f16e438523d2a3352f933733b883e762251b6807b14d00489db475f16cfe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4224.0.0-darwin-arm64.tar.gz"
      sha256 "6211f90b3b0e3750b378f68890119d20abb14e7215ea6c21921069428bed53d0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4224.0.0-linux-x64.tar.gz"
    sha256 "163de5393170e9bdf865c0d1997c7c123734bfcc898ae4291a152ea65de24056"
  end
  version "4224.0.0"
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
