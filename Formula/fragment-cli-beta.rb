require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8391.0.0-darwin-x64.tar.gz"
    sha256 "fae903e77038028071a2f16742f0b82958f78f75ffaa51ed28405469d3a4427d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8391.0.0-darwin-arm64.tar.gz"
      sha256 "a2841d093552ff5dc11d11cdbb714563f90448fef4bc7ff565137f055584c8b0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8391.0.0-linux-x64.tar.gz"
    sha256 "1ec7b7800a2c2b7e8790fb2462a64db28795b41d657fccf09183f4617917df15"
  end
  version "8391.0.0"
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
