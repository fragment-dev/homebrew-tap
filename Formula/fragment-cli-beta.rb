require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4844.0.0-darwin-x64.tar.gz"
    sha256 "e6c9695fb713ac06e5708a27e54beee36c665f0e46fe1917d6d98028e740689b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4844.0.0-darwin-arm64.tar.gz"
      sha256 "b89b75c350ffca01e4006cbf229b07d20405f068d55c5b241b61a85d2898fc0b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4844.0.0-linux-x64.tar.gz"
    sha256 "9d58090201e1c8c7f71f990548ec961fab8ab8cec9473abedaf56e9874d9f265"
  end
  version "4844.0.0"
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
