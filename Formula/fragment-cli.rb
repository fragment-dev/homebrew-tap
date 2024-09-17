require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.17-darwin-x64.tar.gz"
    sha256 "615a71436d688c4346cf02ebb5cdc24dd231410c92c5247cfe8dd83d6901a88f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.17-darwin-arm64.tar.gz"
      sha256 "cd0241689eec06d0e65972118d6355073f2baec41fed12730994dd671df21212"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.17-linux-x64.tar.gz"
    sha256 "b7d1520ceb942a880e134700ec9203b15c3dfd910d3aef818462d0de1009f928"
  end
  version "2024.9.17"
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
