require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3726.0.0-darwin-x64.tar.gz"
    sha256 "2708322c736e7a091d044b94f6f0b09325ed43a35b26be0084d6bccd6c891745"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3726.0.0-darwin-arm64.tar.gz"
      sha256 "2be6b117b2ac8ed7c3581d3176ebe628018e94460e75e9c3fa6e1d63865750ed"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3726.0.0-linux-x64.tar.gz"
    sha256 "b6d9d6302937a21857834a2030fcf88be99f8f06a0e1d0166575226ea32ac680"
  end
  version "3726.0.0"
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
