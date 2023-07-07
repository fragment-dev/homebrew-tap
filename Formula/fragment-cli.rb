require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.7-darwin-x64.tar.gz"
    sha256 "fcd355d9067f6514957b29273e7b01ea097812832a7b3a77dce5e845ba8137f0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.7-darwin-arm64.tar.gz"
      sha256 "0d337971c4d80ec41ca8e24faf693878ab5e9b072c9d46442bdcccf99c5f2896"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.7-linux-x64.tar.gz"
    sha256 "f40a8fcf602acdbae64e12193b94c3e0df9bea00a04144c6cd843510cd72d0bb"
  end
  version "2023.7.7"
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
