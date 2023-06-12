require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2829.0.0-darwin-x64.tar.gz"
    sha256 "1785b7d8319e20a364bc3d8e9057ce47727f38a86f9e1d8485224c0441356e11"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2829.0.0-darwin-arm64.tar.gz"
      sha256 "94103c48d34b56c81944f1e3db391cdd224d8cb4b5c3447926a4887cf22c1b71"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2829.0.0-linux-x64.tar.gz"
    sha256 "301c178400113091c41bbeb7dd58af3ce423c30cc7fda54cdd9d0a88810c0e3c"
  end
  version "2829.0.0"
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
