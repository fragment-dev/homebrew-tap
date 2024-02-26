require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4637.0.0-darwin-x64.tar.gz"
    sha256 "11d1c2140a9f175dc95062f8f2d3637d2e39b1b75f07615dc36098489e9428b6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4637.0.0-darwin-arm64.tar.gz"
      sha256 "b37b33e66e3d7262612986524832f0c29fd7c428be26215ec57f91404299cd7c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4637.0.0-linux-x64.tar.gz"
    sha256 "3a9ab284035414c2dd0c193afdefb9a3cd2f3873c87df018b785a729fd768284"
  end
  version "4637.0.0"
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
