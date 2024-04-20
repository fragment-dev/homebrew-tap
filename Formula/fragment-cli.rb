require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.18-darwin-x64.tar.gz"
    sha256 "2984f1f53a404fdb928baf6fdde5e3f4594e9e911f7cc8eb49bd72fa89ea4a59"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.18-darwin-arm64.tar.gz"
      sha256 "1b66ee5d3bc8120bf545678c75dd2fce83a74420d1cedbdaf8ffc954e5574c7e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.18-linux-x64.tar.gz"
    sha256 "a121609d104ba2a9586d039e93b1d4c7bba006ed0a0652602660f66fec47a0c5"
  end
  version "2024.4.18"
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
