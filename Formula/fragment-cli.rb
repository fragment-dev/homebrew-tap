require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.26-darwin-x64.tar.gz"
    sha256 "c9218fe5ee97ba2335fb0e6e11f8ec2af7aedb9e6d5c9f05ab2a4935aaa31250"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.26-darwin-arm64.tar.gz"
      sha256 "c4d01c961c47af6ff6e374463484c6122ca625aa1e7fef4681cc158fec9dc9de"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.26-linux-x64.tar.gz"
    sha256 "be20ea6ab85e3844c6e0be91f1faca12e79518085e140f70170a709d6394a0fd"
  end
  version "2024.11.26"
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
