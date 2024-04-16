require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4907.0.0-darwin-x64.tar.gz"
    sha256 "9732c920277df059f9e1b4305c5491d5d520387236265aacc86ee111d4b95f4a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4907.0.0-darwin-arm64.tar.gz"
      sha256 "14f09891b16a0e3af141cfc3f042a50c0d3d22eeb1d9ac461bf77986b82e54b9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4907.0.0-linux-x64.tar.gz"
    sha256 "34403d5f3aa92d5e38cccfab27d09c4a8a81c8d67fec6a89fb63b2715662a931"
  end
  version "4907.0.0"
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
