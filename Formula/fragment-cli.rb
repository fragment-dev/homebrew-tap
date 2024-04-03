require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.3-darwin-x64.tar.gz"
    sha256 "4c63df80b4f1b9dd7e6d7ad52ae3e8d4abb1e49ebe3c5b115f9160a0bd6e17f9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.3-darwin-arm64.tar.gz"
      sha256 "01d3bdb46a565d644d338b849a6368acc2a325fdb92b7d8e157873b36a17821c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.3-linux-x64.tar.gz"
    sha256 "a03bea3f81ac1e4206c1aa79c0009fc4a42f2c13a52160f7da8be78743566761"
  end
  version "2024.4.3"
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
