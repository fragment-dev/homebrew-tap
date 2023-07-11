require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3031.0.0-darwin-x64.tar.gz"
    sha256 "0256a6771a9cc72700981b66b2357d5bcdbbb6d91fd8698521261514492a3551"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3031.0.0-darwin-arm64.tar.gz"
      sha256 "383ac93fdf5a654302d5c3dd77a18c5c08260dae3f077c24e5af34e4942b7ddf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3031.0.0-linux-x64.tar.gz"
    sha256 "15b03eabaecd8b7ad821493f67a736cc72dbba384793501a3600ca0c700faeea"
  end
  version "3031.0.0"
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
