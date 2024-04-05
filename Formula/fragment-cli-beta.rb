require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4853.0.0-darwin-x64.tar.gz"
    sha256 "ef3695806542ff9897d2c96273fb42526b78949f23ed7a685fad93f98be9a089"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4853.0.0-darwin-arm64.tar.gz"
      sha256 "83e02d322b4f368d70d4c795b093eef60e839c02e8c674ed0e4b0a0382c26ce3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4853.0.0-linux-x64.tar.gz"
    sha256 "df663c95a025b8501fb47157d2f4cb7a2a75af73a34552cf7cd1c49a1dd3e0a2"
  end
  version "4853.0.0"
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
