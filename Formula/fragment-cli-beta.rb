require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4794.0.0-darwin-x64.tar.gz"
    sha256 "44be2d996adaf8361b0e2f71d37288ca1745bbf52adb1849c194c90cda460e4a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4794.0.0-darwin-arm64.tar.gz"
      sha256 "5fda8409f41760582b38b5cff81614a8496ae851472827224d6bc5074d162f2d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4794.0.0-linux-x64.tar.gz"
    sha256 "895f39bca6cf15f647f2b28f8608edd6786850334c519a190d47797ffdc73766"
  end
  version "4794.0.0"
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
