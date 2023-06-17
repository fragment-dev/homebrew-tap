require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2871.0.0-darwin-x64.tar.gz"
    sha256 "26af590ddd16464afc79cc92ef79512874e4e691f3d91b5e4205fe1284ccd579"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2871.0.0-darwin-arm64.tar.gz"
      sha256 "e1d9a2beef338eda6a7a28316a9559320b61fba066c6590df300561267b03464"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2871.0.0-linux-x64.tar.gz"
    sha256 "420114f7c0c8366dad26524f2b2d185d5d413bacd05510633b826d86b7bd85fc"
  end
  version "2871.0.0"
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
