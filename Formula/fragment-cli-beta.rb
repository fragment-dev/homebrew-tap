require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4642.0.0-darwin-x64.tar.gz"
    sha256 "c561afaf49395c612d468b2dbc3d9db859c11a9c77fed74caf0280474b2eae4b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4642.0.0-darwin-arm64.tar.gz"
      sha256 "e08af5bb2c5d3fb067326b0850ff23aa3716d9315b1846388c2db98de5a2658f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4642.0.0-linux-x64.tar.gz"
    sha256 "042d50b3e2fc987aa34894df2647afeb653015fd8c51ed4cd0ab2b0e8b72ebbe"
  end
  version "4642.0.0"
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
