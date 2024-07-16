require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5399.0.0-darwin-x64.tar.gz"
    sha256 "fa19f093f4d223415952a0f2588658ada60a2438027e7edc812b0a270f4b3951"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5399.0.0-darwin-arm64.tar.gz"
      sha256 "05f22a2ec1f156d4d7ac5233bcccfa84d4f76bf1b0078d9f8321ebf454cc20a8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5399.0.0-linux-x64.tar.gz"
    sha256 "f301c10681a3c5f0a1cbf99c6d7f383f53233c2b654f79b06492c718ba1c777a"
  end
  version "5399.0.0"
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
