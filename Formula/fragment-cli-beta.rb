require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5684.0.0-darwin-x64.tar.gz"
    sha256 "05096e0e1d43022a0cfab7230de845e9a10321ed254a963856f0851847a053db"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5684.0.0-darwin-arm64.tar.gz"
      sha256 "91c73b6bde4125f890058cf190488b3fe14935eb377ca38b0f1b121369e0ee88"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5684.0.0-linux-x64.tar.gz"
    sha256 "ca85e015893694a21701bf9907f27a08b02c061de7fbf7267253ea59ee1e9e01"
  end
  version "5684.0.0"
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
