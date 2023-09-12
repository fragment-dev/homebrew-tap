require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3531.0.0-darwin-x64.tar.gz"
    sha256 "c813aefaab1bef5cafff315b3d989eb749e43f45be7948640c59fe788d786f5a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3531.0.0-darwin-arm64.tar.gz"
      sha256 "5493501efc244edeca89a20fd3f521204c640b783996c1391facec3f258f504d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3531.0.0-linux-x64.tar.gz"
    sha256 "2ca3f74583e6a8332fa558f4e96084725c7bdf4eb2dde62370a3e252b0c10942"
  end
  version "3531.0.0"
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
