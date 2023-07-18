require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3111.0.0-darwin-x64.tar.gz"
    sha256 "58992424ff0975fff9a42084021e7f3d46dee21616d687cbf581406d6b2c1096"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3111.0.0-darwin-arm64.tar.gz"
      sha256 "26a4af4fe3b8d34dcc18f30652cbe8d814b3dda38fd205f914bb2b976d3d364e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3111.0.0-linux-x64.tar.gz"
    sha256 "38d65530a9009eb64e40a8dc52d7ca86005e5442b01414f83c3303b2a2d1003a"
  end
  version "3111.0.0"
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
