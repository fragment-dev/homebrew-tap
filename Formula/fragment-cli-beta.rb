require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5947.0.0-darwin-x64.tar.gz"
    sha256 "0181efd9b84866926cef35a559d94e2fa26882848389fa77b12b662e908fee8e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5947.0.0-darwin-arm64.tar.gz"
      sha256 "a08f034e53545ea1d0c063488f64d1949ead4f84d184d887f55dbd3f0ff430d7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5947.0.0-linux-x64.tar.gz"
    sha256 "8d342ca2b0e2d2be656eaf949c4414016be5b3d2b213915ebec2a3d10fa9eae4"
  end
  version "5947.0.0"
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
