require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5788.0.0-darwin-x64.tar.gz"
    sha256 "6b6874603d5d3d1c4590519542f73c8591033b90e25d4e976e3db5b06c230b22"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5788.0.0-darwin-arm64.tar.gz"
      sha256 "f167a6a19ed8fc268ee404b83bd1551c35bace9be71775c7f9c8f7b2dcefcb5b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5788.0.0-linux-x64.tar.gz"
    sha256 "c0d172df1152df5cd59b6cf5d31acff2aba15c50522acc4c5c0f1f75a6842948"
  end
  version "5788.0.0"
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
