require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4266.0.0-darwin-x64.tar.gz"
    sha256 "dad3e241f9acd72970d97ecd6d01cef2d7c0a0486a268961d716b13204c8ab82"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4266.0.0-darwin-arm64.tar.gz"
      sha256 "86fe4e71b2f169edd5c68cf393e28808579ce4a54d080c00d327c42fb54b9a54"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4266.0.0-linux-x64.tar.gz"
    sha256 "2f4207d20d844f2290e1097cbcae3b0a1c0598c4abfd394cdfb0473bebd42c9c"
  end
  version "4266.0.0"
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
