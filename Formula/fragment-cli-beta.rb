require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3965.0.0-darwin-x64.tar.gz"
    sha256 "793d012b79be3d00ad69d6ba5e4f0947ca15f8421945fc46557161f89febb554"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3965.0.0-darwin-arm64.tar.gz"
      sha256 "f63b315083ad62e60ac2e7f2ffff7c93d00546fb2d533d95c4027e3dbc85e61f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3965.0.0-linux-x64.tar.gz"
    sha256 "ef85b4aecb0d3c927c4f55def569db787e2b81e6a9e51575f125f7b7c520c960"
  end
  version "3965.0.0"
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
