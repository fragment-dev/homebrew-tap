require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.20-2-darwin-x64.tar.gz"
    sha256 "c2d04dc87efe70b1b30ff33f6285216c0796a99ea977f29fd9be7cb34d3be131"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.20-2-darwin-arm64.tar.gz"
      sha256 "6e0d4e99f8f37b0fd047175b6ea47da8d1d2bf8757aefa315bd7e7cf540c9550"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.20-2-linux-x64.tar.gz"
    sha256 "f6da5883159797f81c95bf3fef9381511f9e002ab0062f608deee142af91e13a"
  end
  version "2023.3.20-2"
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
