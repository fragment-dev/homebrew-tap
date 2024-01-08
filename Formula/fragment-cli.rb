require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.8-1-darwin-x64.tar.gz"
    sha256 "410eb136fd591d7c1a7dc284608ed817350eef1e80977b2e3f9202325760e8d7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.8-1-darwin-arm64.tar.gz"
      sha256 "02b772d133fdffdea5992a12f30cd4b4b7e7afe0c22099fdb17e7c07cc6a3d00"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.8-1-linux-x64.tar.gz"
    sha256 "c6d4540384ae88efbd7cdf77866b60fd2d3d4a12499dd0d41f0d198053f963d6"
  end
  version "2024.1.8-1"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
