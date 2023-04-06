require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2374.0.0-darwin-x64.tar.gz"
    sha256 "28f83358b153e6a345bba692fbe9b3d710db82ae2d3a424e59e2f54c01aaee7e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2374.0.0-darwin-arm64.tar.gz"
      sha256 "0c5bd54d198d0f752837242b8d5d843b7c24a9509693289a53b582578e87b40e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2374.0.0-linux-x64.tar.gz"
    sha256 "5842a41f694aaa9bc3c3a1a5a9c17cbec393881070b444e843651aa3fb7cd0b3"
  end
  version "2374.0.0"
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
