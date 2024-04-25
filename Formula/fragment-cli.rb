require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.25-darwin-x64.tar.gz"
    sha256 "fa2715fe9738d0fcc0c6a6f86f4c3e68e8cec3ba838984f35daf7cb087d2edf2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.25-darwin-arm64.tar.gz"
      sha256 "ceb45b3026050983c3259a3396b58d81a50f5ca591cd8ae81f75539eaf5bfe00"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.25-linux-x64.tar.gz"
    sha256 "704f8a478e2ed306f6eccd07685cc89dac08bb8da4b050380cb77f9dcaa124f8"
  end
  version "2024.4.25"
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
