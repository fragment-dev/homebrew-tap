require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3480.0.0-darwin-x64.tar.gz"
    sha256 "fa6c00c01e3b4b279c29b6173b26ccb6cd84ed2fbce43b203d6a963602d5205e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3480.0.0-darwin-arm64.tar.gz"
      sha256 "cc0805f41cb92de40dea8a88bf9071fef08f7bb9859b6f513506f91bf9c1fb51"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3480.0.0-linux-x64.tar.gz"
    sha256 "06a0e37d436e61e64f07079970507188340a603fa6c27b404210b33cb50b2ef0"
  end
  version "3480.0.0"
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
