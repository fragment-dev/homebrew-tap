require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.6-darwin-x64.tar.gz"
    sha256 "8ee03993f7088a50886fb6de32c73a802a8f04315f642f649418572be6b45e0d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.6-darwin-arm64.tar.gz"
      sha256 "1625cf7368d873dc0c6547d6a312ad5dadbe8e90260aedc6f6511c07cc167b1b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.6-linux-x64.tar.gz"
    sha256 "0e60e1a875e77616cca6855ea74807b12432234da09255329af9c128d2189deb"
  end
  version "2023.6.6"
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
