require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3626.0.0-darwin-x64.tar.gz"
    sha256 "c5ec5f69f6757c4d831cc8f7fc76332449a8e70ed592eff202597cd50807324b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3626.0.0-darwin-arm64.tar.gz"
      sha256 "ec820d70377dd59ee8df37a325ec7a919446123580af1327cb2eff6bae5db2b5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3626.0.0-linux-x64.tar.gz"
    sha256 "84063fed1451adde64e5df4bfb825ad75f0d3489d831c05ae2f28165cc2d225b"
  end
  version "3626.0.0"
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
