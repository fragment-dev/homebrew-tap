require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3471.0.0-darwin-x64.tar.gz"
    sha256 "0e08cddf15c3a8ee602574a38bdf16948bbc5dc05e2309614c63e2e32c12345c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3471.0.0-darwin-arm64.tar.gz"
      sha256 "27c668909f8994a0e9c5bae31e7c95f270839633dd3e08e604221b7e57f2f4a0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3471.0.0-linux-x64.tar.gz"
    sha256 "4ac1dbdebf16756887da409d8087760e27567a3d70fa5f0c425f84626cd0d987"
  end
  version "3471.0.0"
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
