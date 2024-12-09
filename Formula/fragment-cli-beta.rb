require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5867.0.0-darwin-x64.tar.gz"
    sha256 "d6d24c525c1f142a7f4a61c7e791e2f714c10d81b689d05650e5215c7ce7eb71"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5867.0.0-darwin-arm64.tar.gz"
      sha256 "8d58596ac9f62ac4c9425ba40c624b17c5a6b27f4a8c1a0fbe40c80aaea04c56"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5867.0.0-linux-x64.tar.gz"
    sha256 "385cf63febf4ca716998649e23b0c479ca162e17b4a175e1dc778addbcc06164"
  end
  version "5867.0.0"
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
